#include "script_component.hpp"
/*
 * Author: commy2
 * Moves a rallypoint to the players location.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Side <SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player, side ACE_Player] call ace_respawn_fnc_moveRallypoint
 *
 * Public: No
 */

params ["_unit", "_side"];

private _rallypoint = [
    objNull,
    missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
] select ([west, east, independent] find _side) + 1;

TRACE_3("moving rally",_unit,_rallypoint,typeOf _rallypoint);

if (isNull _rallypoint) exitWith {};

private _position = getPosATL _unit;
_position = _position findEmptyPosition [0, 2, typeOf _rallypoint];

if (_position isEqualTo []) then {_position = getPosATL _unit};

_position set [2, 0];

[localize LSTRING(Deploy)] call EFUNC(common,displayTextStructured);

[{
    params ["_rallypoint", "_unit", "_position"];

    _rallypoint setPosATL _position;
    _unit reveal _rallypoint;

    _rallypoint setVariable [QGVAR(markerDate), [dayTime, "HH:MM"] call BIS_fnc_timeToString, true];

    ["ace_rallypointMoved", [_rallypoint, _side, _position]] call CBA_fnc_globalEvent;

    [localize LSTRING(Deployed)] call EFUNC(common,displayTextStructured);
}, [_rallypoint, _unit, _position], 5] call CBA_fnc_waitAndExecute;
