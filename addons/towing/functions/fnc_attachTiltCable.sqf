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
 * [player, tank, [0,0,0]] call ace_towing_fnc_attachTiltCable
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_startingOffset", "_startDistanceFromCenter", "_closeInUnitVector", "_closeInMax", "_closeInMin", "_closeInDistance", "_endPosTestOffset", "_endPosTest", "_doesIntersect", "_startingPosShifted", "_startASL", "_endPosShifted", "_endASL", "_stage", "_helper", "_rope", "_weaponSelect"];
params ["_unit", "_attachToVehicle", "_startingPosition"];

_startingOffset = _attachToVehicle worldToModel _startingPosition;

_startDistanceFromCenter = vectorMagnitude _startingOffset;
_closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0,0,0]);

_closeInMax = _startDistanceFromCenter;
_closeInMin = 0;

while {(_closeInMax - _closeInMin) > 0.01} do {
    _closeInDistance = (_closeInMax + _closeInMin) / 2;
    // systemChat format ["Trying %1 from %2 start %3", _closeInDistance, [_closeInMax, _closeInMin], _startDistanceFromCenter];
    _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
    _endPosTestOffset set [2, (_startingOffset select 2)];
    _endPosTest = _attachToVehicle modelToWorldVisual _endPosTestOffset;

    _doesIntersect = false;
    {
        if (_doesIntersect) exitWith {};
        _startingPosShifted = _startingPosition vectorAdd _x;
        _startASL = if (surfaceIsWater _startingPosShifted) then {_startingPosShifted} else {ATLtoASL _startingPosShifted};
        {
            _endPosShifted = _endPosTest vectorAdd _x;
            _endASL = if (surfaceIsWater _startingPosShifted) then {_endPosShifted} else {ATLtoASL _endPosShifted};

            //Uncomment to see the lazor show, and see how the scanning works:
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

//Checks (too close to center or can't attach)
if (((_startDistanceFromCenter - _closeInDistance) < 0.1)) exitWith {
    TRACE_2("no valid spot found",_closeInDistance,_startDistanceFromCenter);
    [localize LSTRING(Failed)] call EFUNC(common,displayTextStructured);
};

//Move it out slightly, for visibility sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_closeInDistance = _closeInDistance - 0.0085;

_endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, _startingOffset select 2];

_stage = (ACE_player getVariable [QGVAR(isTilting), 0]) + 1;

_attachToVehicle setVariable [QGVAR(tiltUp), _unit, true];

if (_stage == 1) then {
    _unit setVariable [QGVAR(selectedWeaponOnTilt), currentWeapon _unit];
    _unit action ["SwitchWeapon", _unit, _unit, 99];

    _helper = "Sign_Sphere10cm_F" createVehicle position _unit;
    _helper attachTo [_unit, [-0.02,-0.05,0], "righthandmiddle1"];

    [_helper, "{_this hideObject true}", 2] call EFUNC(common,execRemoteFnc);
    [{
        params ["_unit", "_attachToVehicle", "_endPosTestOffset", "_helper"];
        _rope = ropeCreate [_attachToVehicle, _endPosTestOffset, _helper, [0, 0, 0], 20];
        _unit setVariable [QGVAR(tiltRope), _rope];
    }, [_unit, _attachToVehicle, _endPosTestOffset, _helper], 1, 0] call EFUNC(common,waitAndExecute);

    _unit setVariable [QGVAR(tiltHelper), _helper];
    _unit setVariable [QGVAR(tiltVehicle), _attachToVehicle];
    _unit setVariable [QGVAR(tiltVehiclePos), _endPosTestOffset];
    _unit setVariable [QGVAR(isTilting), 1];
} else {
    if (_stage == 2) then {
        _rope = _unit getVariable QGVAR(tiltRope);
        ropeDestroy _rope;
        _rope = ropeCreate [_attachToVehicle, _endPosTestOffset, (_unit getVariable QGVAR(tiltVehicle)), (_unit getVariable QGVAR(tiltVehiclePos)), 20];
        _unit setVariable [QGVAR(tiltVehiclePos), nil];

        deleteVehicle (_unit getVariable QGVAR(tiltHelper));
        _unit setVariable [QGVAR(tiltHelper), nil];

        [_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);

        _unit setVariable [QGVAR(tiltVehicleTow), _attachToVehicle];
        _unit setVariable [QGVAR(tiltRope), _rope];
        _unit setVariable [QGVAR(isTilting), 2];

        _weaponSelect = _unit getVariable QGVAR(selectedWeaponOnTilt);
        _unit selectWeapon _weaponSelect;
        _unit setVariable [QGVAR(selectedWeaponOnTilt), nil];
    };
};
