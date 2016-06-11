/*
 * Author: GitHawk
 * Checks if valid attach position and attaches a tilt cable.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Attach Target <OBJECT>
 * 2: Virtual Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, tank, [0,0,0]] call ace_tilting_fnc_attachCable
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_attachToVehicle", "_startingPosition"];

private _startingOffset = _attachToVehicle worldToModel _startingPosition;

private _startDistanceFromCenter = vectorMagnitude _startingOffset;
private _closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0, 0, 0]);

private _closeInMax = _startDistanceFromCenter;
private _closeInMin = 0;

private ["_closeInDistance", "_endPosTestOffset"];

while {(_closeInMax - _closeInMin) > 0.01} do {
    _closeInDistance = (_closeInMax + _closeInMin) / 2;
    // systemChat format ["Trying %1 from %2 start %3", _closeInDistance, [_closeInMax, _closeInMin], _startDistanceFromCenter];
    _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
    _endPosTestOffset set [2, (_startingOffset select 2)];
    private _endPosTest = _attachToVehicle modelToWorldVisual _endPosTestOffset;

    private _doesIntersect = false;
    {
        if (_doesIntersect) exitWith {};
        private _startingPosShifted = _startingPosition vectorAdd _x;
        private _startASL = if (surfaceIsWater _startingPosShifted) then {_startingPosShifted} else {ATLtoASL _startingPosShifted};
        {
            private _endPosShifted = _endPosTest vectorAdd _x;
            private _endASL = if (surfaceIsWater _startingPosShifted) then {_endPosShifted} else {ATLtoASL _endPosShifted};

            // Uncomment to see the lazor show, and see how the scanning works:
            // drawLine3D [_startingPosShifted, _endPosShifted, [1,0,0,1]];
            if (_attachToVehicle in lineIntersectsWith [_startASL, _endASL, _unit]) exitWith {_doesIntersect = true};
        } forEach [[0,0,0.045], [0,0,-0.045], [0,0.045,0], [0,-0.045,0], [0.045,0,0], [-0.045,0,0]];
    } forEach [[0,0,0], [0,0,0.05], [0,0,-0.05]];

    if (_doesIntersect) then {
        _closeInMax = _closeInDistance;
    } else {
        _closeInMin = _closeInDistance;
    };
};

_closeInDistance = (_closeInMax + _closeInMin) / 2;

// Checks (too close to center or can't attach)
if ((_startDistanceFromCenter - _closeInDistance) < 0.1 || {!alive _attachToVehicle} || {_attachToVehicle distance _unit > 7}) exitWith {
    TRACE_2("no valid spot found",_closeInDistance,_startDistanceFromCenter);
    [LSTRING(FailedConnecting)] call EFUNC(common,displayTextStructured);
};

// Move it out slightly, for visibility sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_closeInDistance = _closeInDistance - 0.0085;

_endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, _startingOffset select 2];

private _stage = _unit getVariable [QGVAR(stage), 0];

if (_stage == 0) then {
    _attachToVehicle setVariable [QGVAR(up), _unit, true];
    _unit setVariable [QGVAR(selectedWeapon), currentWeapon _unit];
    _unit call EFUNC(common,fixLoweredRifleAnimation);
    _unit action ["SwitchWeapon", _unit, _unit, 99];
};

[2, [_stage, _unit, _attachToVehicle, _endPosTestOffset], {
    (_this select 0) params ["_stage", "_unit", "_attachToVehicle", "_endPosTestOffset"];

    if (_stage == 0) exitWith {
        private _helper = "Sign_Sphere10cm_F" createVehicle position _unit;
        _helper attachTo [_unit, [-0.02, -0.05, 0], "righthandmiddle1"];
        [QEGVAR(common,hideObjectGlobal), [_helper, true]] call CBA_fnc_serverEvent;

        private _rope = ropeCreate [_attachToVehicle, _endPosTestOffset, _helper, [0, 0, 0], 10];

        _unit setVariable [QGVAR(stagedInfo), [_rope, _helper, _attachToVehicle, _endPosTestOffset]];
        _unit setVariable [QGVAR(stage), 1];

        [LSTRING(SuccessConnecting), 2] call EFUNC(common,displayTextStructured);
    };

    if (_stage == 1) exitWith {
        (_unit getVariable QGVAR(stagedInfo)) params ["_rope", "_helper", "_vehicle", "_vehiclePos"];

        ropeDestroy _rope;
        deleteVehicle _helper;
        _rope = ropeCreate [_attachToVehicle, _endPosTestOffset, _vehicle, _vehiclePos, 10];

        _unit setVariable [QGVAR(stagedInfo), [_rope, nil, _vehicle]];
        _unit setVariable [QGVAR(stage), 2];

        private _weaponSelect = _unit getVariable QGVAR(selectedWeapon);
        _unit selectWeapon _weaponSelect;
        _unit setVariable [QGVAR(selectedWeapon), nil];

        [_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

        [LSTRING(SuccessConnecting), 2] call EFUNC(common,displayTextStructured);
    };
}, {
    (_this select 0) params ["", "_unit", "_attachToVehicle"];

    [LSTRING(FailedConnecting)] call EFUNC(common,displayTextStructured);
    if (_stage != 1) then {
        [_unit] call FUNC(cancelConnect);
    };
    _attachToVehicle setVariable [QGVAR(up), nil, true];
}, localize LSTRING(Connecting)] call EFUNC(common,progressBar);
