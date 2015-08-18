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
private _closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0,0,0]);

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
if (((_startDistanceFromCenter - _closeInDistance) < 0.1)) exitWith {
    TRACE_2("no valid spot found",_closeInDistance,_startDistanceFromCenter);
    [localize LSTRING(Failed)] call EFUNC(common,displayTextStructured);
};

// Move it out slightly, for visibility sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_closeInDistance = _closeInDistance - 0.0085;

_endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, _startingOffset select 2];

private _stage = (ACE_player getVariable [QGVAR(tiltingStage), 0]) + 1;

_attachToVehicle setVariable [QGVAR(tiltUp), _unit, true];

if (_stage == 1) exitWith {
    _unit setVariable [QGVAR(selectedWeaponOnTilt), currentWeapon _unit];
    _unit action ["SwitchWeapon", _unit, _unit, 99];

    private _helper = "Sign_Sphere10cm_F" createVehicle position _unit;
    _helper attachTo [_unit, [-0.02,-0.05,0], "righthandmiddle1"];
    [QEGVAR(common,hideObjectGlobal), [_helper, true]] call CBA_fnc_serverEvent;

    [{
        params ["_unit", "_attachToVehicle", "_endPosTestOffset", "_helper"];
        private _rope = ropeCreate [_attachToVehicle, _endPosTestOffset, _helper, [0, 0, 0], 20];
        _unit setVariable [QGVAR(tiltRope), _rope];
    }, [_unit, _attachToVehicle, _endPosTestOffset, _helper], 1, 0] call CBA_fnc_waitAndExecute;

    _unit setVariable [QGVAR(tiltHelper), _helper];
    _unit setVariable [QGVAR(tiltVehicle), _attachToVehicle];
    _unit setVariable [QGVAR(tiltVehiclePos), _endPosTestOffset];
    _unit setVariable [QGVAR(tiltingStage), 1];
};

if (_stage == 2) exitWith {
    _rope = _unit getVariable QGVAR(tiltRope);
    ropeDestroy _rope;
    _rope = ropeCreate [_attachToVehicle, _endPosTestOffset, (_unit getVariable QGVAR(tiltVehicle)), (_unit getVariable QGVAR(tiltVehiclePos)), 20];
    _unit setVariable [QGVAR(tiltVehiclePos), nil];

    deleteVehicle (_unit getVariable QGVAR(tiltHelper));
    _unit setVariable [QGVAR(tiltHelper), nil];

    [_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

    _unit setVariable [QGVAR(tiltRope), _rope];
    _unit setVariable [QGVAR(tiltingStage), 2];

    private _weaponSelect = _unit getVariable QGVAR(selectedWeaponOnTilt);
    _unit selectWeapon _weaponSelect;
    _unit setVariable [QGVAR(selectedWeaponOnTilt), nil];
};
