#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Places a flag in front of the unit.
 *
 * Arguments:
 * 0: Unit <OPJECT>
 * 1: Flag <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, _flag] call ace_marker_flags_fnc_pickupFlag
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_flag", objNull, [objNull]]];

if (isNull _flag) exitWith {};

[_unit, "PutDown"] call EFUNC(common,doGesture);
deleteVehicle _flag;
[_unit, configName configOf _flag] call EFUNC(common,addToInventory);
