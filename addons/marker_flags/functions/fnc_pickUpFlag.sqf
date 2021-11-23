#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Places a flag in front of the player
 *
 * Arguments:
 * 0: Flag <OBJECT>
 * 1: Unit <OPJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [_flag, ace_player] call ace_marker_flags_pickupFlag;
 *
 * Public: No
 */

params [["_flag", objNull, [objNull]], ["_unit", objNull, [objNull]]];

if (_flag isEqualTo objNull) exitWith {};

[_unit, 'PutDown'] call ace_common_fnc_doGesture;
deleteVehicle _flag;
_unit addItem (configName configOf _flag);
