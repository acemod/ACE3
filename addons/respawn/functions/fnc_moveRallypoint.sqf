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
#include "script_component.hpp"

params ["_unit", "_side"];

private ["_rallypoint", "_position"];

_rallypoint = [
    objNull,
    missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
] select ([west, east, independent] find _side) + 1;

TRACE_3("moving rally",_unit,_rallypoint,typeOf _rallypoint);

if (isNull _rallypoint) exitWith {};

_position = getPosATL _unit;
_position = _position findEmptyPosition [0, 2, typeOf _rallypoint];

if (_position isEqualTo []) then {_position = getPosATL _unit};

_position set [2, 0];

[localize LSTRING(Deploy)] call EFUNC(common,displayTextStructured);

[{
    params ["_rallypoint", "_unit", "_position"];

    _rallypoint setPosATL _position;
    _unit reveal _rallypoint;

    _rallypoint setVariable [QGVAR(markerDate), format ["%1:%2", date select 3, date select 4], true];

    ["rallypointMoved", [_rallypoint, _side, _position]] call EFUNC(common,globalEvent);

    [localize LSTRING(Deployed)] call EFUNC(common,displayTextStructured);
}, [_rallypoint, _unit, _position], 5] call EFUNC(common,waitAndExecute);
