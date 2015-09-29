/*
 * Author: PabstMirror
 * Returns the seat position of a UAV that the unit is activly controling.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Position <STRING>
 *   "" = not connected to anything or activly controling
 *   "DRIVER"
 *   "GUNNER"
 *
 * Example:
 * [ACE_Player] call ace_common_fnc_getUavControlPosition
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

private ["_uav", "_positionArray", "_playerIndex"];

_uav = getConnectedUAV _unit;

if (isNull _uav) exitWith {""};

_positionArray = UAVControl _uav;
_playerIndex = _positionArray find _unit;

if (_playerIndex == -1) exitWith {""};

_positionArray select (_playerIndex + 1)
