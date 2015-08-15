/*
 * Author: GitHawk et.al
 * Calculates a connection for tilting
 * With code from ace_attach
 *
 * Arguments:
 * 0: The player <OBJECT>
 * 1: The target <OBJECT>
 * 2: The visual position <ARRAY>
 * 3: The nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, tank, [0,0,0], nozzle] call ace_refuel_fnc_connectNozzleAction
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_startingOffset", "_startDistanceFromCenter", "_closeInUnitVector", "_closeInMax", "_closeInMin", "_closeInDistance", "_endPosTestOffset", "_endPosTest", "_doesIntersect", "_startingPosShifted", "_endASL", "_rate", "_maxFuel"];

params ["_unit", "_target", "_startingPosition", "_nozzle"];
_startingOffset = _target worldToModel _startingPosition;

_startDistanceFromCenter = vectorMagnitude _startingOffset;
_closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0,0,0]);

_closeInMax = _startDistanceFromCenter;
_closeInMin = 0;

while {(_closeInMax - _closeInMin) > 0.01} do {
    _closeInDistance = (_closeInMax + _closeInMin) / 2;
    _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
    _endPosTestOffset set [2, (_startingOffset select 2)];
    _endPosTest = _target modelToWorldVisual _endPosTestOffset;

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
            if (_target in lineIntersectsWith [_startASL, _endASL, _unit]) exitWith {_doesIntersect = true};
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
if (((_startDistanceFromCenter - _closeInDistance) < 0.1) || {!([_target, _unit, _itemClassname] call FUNC(canAttach))}) exitWith {
    TRACE_2("no valid spot found",_closeInDistance,_startDistanceFromCenter);
    [localize LSTRING(Failed)] call EFUNC(common,displayTextStructured);
};

//Move it out slightly, for visibility sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_closeInDistance = (_closeInDistance - 0.0085);

_endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, (_startingOffset select 2)];

// TODO put animation and delayed connect ?

_unit setVariable [QGVAR(nozzle), nil];
detach _nozzle;
[_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);

_weaponSelect = _unit getVariable QGVAR(selectedWeaponOnRefuel);
_unit selectWeapon _weaponSelect;
_unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];

_source = _nozzle getVariable QGVAR(source);
if (_source == _target) exitWith {
    _source setVariable [QGVAR(isConnected), false, true]; 
    ropeDestroy (_nozzle getVariable QGVAR(rope));
    deleteVehicle _nozzle;
    _unit setVariable [QGVAR(isRefueling), false];
};

_nozzle attachTo [_target, _endPosTestOffset];
_nozzle setVariable [QGVAR(sink), _target, true];
_nozzle setVariable [QGVAR(fueling), 1, true];
_target setVariable [QGVAR(nozzle), _nozzle, true];

[_unit, _target, _nozzle] call FUNC(refuel);

true