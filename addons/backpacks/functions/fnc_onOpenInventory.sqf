/*
 * Author: commy2
 *
 * Handle the open inventory event. Display message on traget client.
 * 
 * Argument:
 * Input from "InventoryOpened" eventhandler
 * 
 * Return value:
 * false. Always open the inventory dialog. (Bool)
 */
#include "script_component.hpp"

private ["_unit", "_backpack"];

_unit = _this select 0;
_backpack = _this select 1;

// exit if the target is not a backpack
if !([_backpack] call FUNC(isBackpack)) exitWith {};

// get the unit that wears the backpack object
private "_target";
_target = [_backpack] call FUNC(getBackpackAssignedUnit);

// raise event on target unit
["backpackOpened", _target, [_unit, _target, _backpack]] call EFUNC(common,targetEvent);

// return false to open inventory as usual
false
