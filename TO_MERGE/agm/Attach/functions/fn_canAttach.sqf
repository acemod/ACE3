/*
 * Author: commy2
 *
 * Check if a unit can attach a specific item.
 * 
 * Argument:
 * 0: Unit that wants to attach the object (Object)
 * 1: Name of the attachable item (String)
 * 
 * Return value:
 * Boolean (Bool)
 */

private ["_unit", "_item"];

_unit = _this select 0;
_item = _this select 1;

canStand _unit && {_unit getVariable ["AGM_AttachedItemName", ""] == ""} && {_item in (magazines _unit + items _unit + [""])}
