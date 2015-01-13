/**
 * fn_hasItem_CC.sqf
 * @Descr: Check if unit has an item of type.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, item STRING (Classname of CfgWeapons item)]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_unit","_item"];
_unit = _this select 0;
_item = _this select 1;

if !(_unit isKindOf "CAManBase") exitwith {false};
(_item in ((items _unit) + (assignedItems _unit)));