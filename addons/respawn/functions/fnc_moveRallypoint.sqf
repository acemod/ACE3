/*
    Name: ACE_Respawn_fnc_moveRallypoint

    Author(s):
        commy2

    Description:
        Moves a rallypoint to the player's location

    Parameters:
        0: OBJECT - unit
        1: OBJECT - side

    Returns:
        VOID
*/

#include "script_component.hpp"

PARAMS_2(_unit,_side);

private ["_rallypoint", "_position"];

// rallypoint names are defined in CfgVehicles.hpp

_rallypoint = [
  objNull,
  missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
  missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
  missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
] select ([west, east, independent] find _side) + 1;

TRACE_3("moving rally",_unit, _rallypoint, (typeOf _rallypoint));

if (isNull _rallypoint) exitWith {};

_position = getPosATL _unit;
_position = _position findEmptyPosition [0, 2, typeOf _rallypoint];
if (count _position == 0) then {_position = getPosATL _unit};

_position set [2, 0];

[localize LSTRING(Deploy)] call EFUNC(common,displayTextStructured);

[{
    _rallypoint = _this select 0;
    _unit = _this select 1;
    _position = _this select 2;
    _rallypoint = _this select 3;

    _rallypoint setPosATL _position;
    _unit reveal _rallypoint;

    _rallypoint setVariable [QGVAR(markerDate), format ["%1:%2", date select 3, date select 4], true];

    ["rallypointMoved", [_rallypoint, _side, _position]] call EFUNC(common,globalEvent);

    [localize LSTRING(Deployed)] call EFUNC(common,displayTextStructured);
},
[_rallypoint, _unit, _position, _rallypoint], 5, 1] call EFUNC(common,waitAndExecute);
