#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles a laser "ping" and forwards it immediately to any handlers
 *
 * Arguments:
 * 0: Source Position (ASL) <ARRAY>
 * 1: Source Direction <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPosASL player, [0.707, 0, 0.707]] call ace_laser_warning_fnc_newLaser;
 *
 * Public: No
 */
params ["_sourcePosition", "_sourceDirection"];
TRACE_2("new laser",_sourcePosition,_sourceDirection);

GVAR(objects) = GVAR(objects) select {
    _x getVariable [QGVAR(enabled), true]
};

private _activeObjects = GVAR(objects) select {
    [_x] call FUNC(isLwsPowered)
};

private _relevantObjects = [];
{
    if ([_sourcePosition, _sourceDirection, _x] call FUNC(laserDetected)) then {
        _relevantObjects pushBack _x;
    };
} forEach _activeObjects;

{
    [_x, _sourcePosition] call FUNC(warn);
} forEach _relevantObjects;