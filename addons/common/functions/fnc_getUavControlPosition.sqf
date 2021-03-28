#include "script_component.hpp"
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

params [["_unit", objNull, [objNull]]];

private _uav = getConnectedUAV _unit;

if (isNull _uav) exitWith {""};

private _positionArray = UAVControl _uav;
private _playerIndex = _positionArray find _unit;

if (_playerIndex == -1) exitWith {""};

_positionArray select (_playerIndex + 1)
