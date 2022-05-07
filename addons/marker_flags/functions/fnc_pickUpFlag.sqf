#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Places a flag in front of the unit.
 *
 * Arguments:
 * 0: Flag <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Action Args <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [_flag,player,"x"] call ace_marker_flags_fnc_pickupFlag
 *
 * Public: No
 */

params [["_flag", objNull, [objNull]], ["_unit", objNull, [objNull]], ["_args", [""], [[]]]];
private _itemName = _args # 0;
TRACE_3("pickupFlag",_unit,_flag,_itemName);

if (isNull _flag) exitWith {};

[_unit, "PutDown"] call EFUNC(common,doGesture);
deleteVehicle _flag;
[_unit, _itemName] call EFUNC(common,addToInventory);
