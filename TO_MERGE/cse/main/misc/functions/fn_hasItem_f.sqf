/**
 * fn_hasItem_f.sqf
 * @Descr: Check if a unit has item
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, item STRING (Classname of item)]
 * @Return: BOOL True if unit has the item in it's inventory
 * @PublicAPI: true
 */


private ["_unit","_item"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_item = [_this, 1, "", [""]] call BIS_fnc_Param;

(_item in items _unit);