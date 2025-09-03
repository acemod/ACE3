#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Get GPS error level
 *
 * This number does not have any real world correlation
 *
 * Arguments:
 * Object with GPS <OBJECT>
 *
 * Return Value:
 * Error <NUMBER>
 *
 * Example:
 * [_unit] call ace_gps_fnc_getError
 *
 * Public: Yes
 */

params [
    ["_object", ACE_player, [objNull]]
];

if (time < (_object getVariable [QGVAR(errorCacheExpire), -1])) exitWith {
    _object getVariable [QGVAR(errorCache), 0];
};

private _points = [_object] call FUNC(getSatLocations);
private _src = getPos _object;
_src set [2, 1.3];
_src = AGLtoASL _src;
private _error = 0;
{
    _error = _error + count lineIntersectsSurfaces [_src, AGLtoASL _x, _object, objNull, true, 3];
} forEach _points;

_object setVariable [QGVAR(errorCache), _error];
_object setVariable [QGVAR(errorCacheExpire), time + 0.5];

_error
