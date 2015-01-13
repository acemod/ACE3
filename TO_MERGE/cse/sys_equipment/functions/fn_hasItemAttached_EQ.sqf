/**
 * fn_hasItemAttached_EQ.sqf
 * @Descr: Check if unit has an item attached
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_unit", "_item"];
_unit = _this select 0;
_item = _unit getvariable ["cse_attachedItem_EQ",objNull];

(!isNull _item);