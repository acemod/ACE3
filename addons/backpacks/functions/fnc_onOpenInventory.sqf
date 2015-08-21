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

private "_target";
params ["","_backpack"];

// exit if the target is not a backpack
if !([_backpack] call FUNC(isBackpack)) exitWith {};

// get the unit that wears the backpack object
_target = _this call FUNC(getBackpackAssignedUnit);

if (isNull _target) exitWith {false};
// raise event on target unit
["backpackOpened", _target, [_target, _backpack]] call EFUNC(common,targetEvent);

// return false to open inventory as usual
false
