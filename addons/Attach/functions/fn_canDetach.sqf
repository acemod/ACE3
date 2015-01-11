/*
 * Author: commy2
 *
 * Check if a unit has an item attached and if it can remove that item.
 * 
 * Argument:
 * 0: Unit that wants to detach something (Object)
 * 
 * Return value:
 * Boolean (Bool)
 */

private "_unit";

_unit = _this select 0;

canStand _unit && {_unit getVariable ["AGM_AttachedItemName", ""] != ""}
