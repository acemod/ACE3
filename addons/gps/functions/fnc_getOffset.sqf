#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Get GPS position with random error
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
 * [_unit] call ace_gps_fnc_getPos
 *
 * Public: Yes
 */

params [
    ["_object", ACE_player, [objNull]]
];

if (time < (_object getVariable [QGVAR(offsetCacheExpire), -1])) exitWith {
    _object getVariable [QGVAR(offsetCache), [0, 0]];
};

private _error = [_object] call FUNC(getError);
if (_error == 0) exitWith { [0,0] };

private _seed = floor (dayTime * 10);

private _pos = getPos _object;
_pos deleteAt 2;
_pos set [0, floor (_pos#0 / 100)];
_pos set [1, floor (_pos#1 / 100)];

private _distance = (_seed random _pos) * _error;
private _direction = (_error random _pos) * 360;

_object setVariable [QGVAR(offsetCache), [_distance, _direction]];
_object setVariable [QGVAR(offsetCacheExpire), time + 3];

[_distance, _direction]
