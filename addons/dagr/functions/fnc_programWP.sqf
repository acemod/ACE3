#include "..\script_component.hpp"
/*
 * Author: Overlord Zorn
 * API to program Waypoints into the DAGR
 *
 * Arguments:
 * 0: Position (2D,3D) <ARRAY>
 * 1: Waypoint Name <STRING> (default: "Waypoint")
 * 2: Index <NUMBER> (default: auto-assign)
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0,0], "Home" ] call ace_dagr_fnc_programWP;
 *
 * Public: Yes
*/

params [
    ["_pos", [0,0], [[]], [2,3]],
    ["_displayName", "Waypoint", [""]],
    ["_index", -1, [0]]
];

if (_index isEqualTo -1) then { _index = GVAR(numWaypoints); };
_index = 0 max _index min 4;
GVAR(numWaypoints) = _index + 1;

private _arr = [_pos] call EFUNC(common,getMapGridFromPos) apply { _x select [0,4] } apply { parseNumber _x };
private _posNum = _arr#0 * 10000 + _arr#1;

missionNamespace setVariable [ format ["%1%2", QGVAR(wpString), _index], _displayName ];
missionNamespace setVariable [ format ["%1%2", QGVAR(wp), _index], _posNum ];
