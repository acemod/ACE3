#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Get "satellite" locations for simulating gps inaccuracy
 *
 * Arguments:
 * Object with GPS <OBJECT>
 *
 * Return Value:
 * Locations <ARRAY>
 *
 * Example:
 * [_unit] call ace_gps_fnc_getSatLocations
 *
 * Public: Yes
 */

params [
    ["_object", ACE_player, [objNull]]
];

private _points = [];
for "_i" from 0 to 5 do {
    private _point = _object getPos [800, _i * 60];
    _point set [2, 500];
    _points pushBack _point;
};
_points
