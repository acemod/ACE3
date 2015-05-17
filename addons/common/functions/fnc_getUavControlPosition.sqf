/*
Name: FUNC(getUavControlPosition)

Author: Pabst Mirror

Description:
  Gets the seat position of a UAV that the unit is activly controlling.
    "" - not connected to anything or not activly controling
    "DRIVER"
    "GUNNER"

Parameters:
  0: OBJECT - Unit

Returns:
  STRING - Position in the UAV that is currently being controled by the unit.

Example:
  [ACE_Player] call FUNC(getUavControlPosition)
*/
#include "script_component.hpp"

private ["_uav", "_positionArray", "_playerIndex"];

PARAMS_1(_unit);
_uav = getConnectedUAV _unit;
if (isNull _uav) exitWith {""};
_positionArray = UAVControl _uav;
_playerIndex = _positionArray find _unit;
if (_playerIndex == -1) exitWith {""};

_positionArray select (_playerIndex + 1)
