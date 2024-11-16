#include "..\script_component.hpp"
/*
 * Author: Brett Mayson, Timi007
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
 * [_flag, player, ["ace_marker_flags_white"]] call ace_marker_flags_fnc_pickupFlag
 *
 * Public: No
 */

params [["_flag", objNull, [objNull]], ["_unit", objNull, [objNull]], ["_args", [""], [[]]]];
_args params ["_item"];
TRACE_3("pickupFlag",_unit,_flag,_item);

if (isNull _flag) exitWith {};

[_unit, "PutDown"] call EFUNC(common,doGesture);

[{
    params ["_flag", "_unit", "_item"];

    [_unit, _item] call EFUNC(common,addToInventory);
    deleteVehicle _flag;
}, [_flag, _unit, _item], 0.7] call CBA_fnc_waitAndExecute;
