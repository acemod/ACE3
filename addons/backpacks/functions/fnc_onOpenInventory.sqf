/*
 * Author: commy2
 * Handle the open inventory event. Camshake and sound on target client.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Backpack <OBJECT>
 *
 * Return Value:
 * false. Always open the inventory dialog. <BOOL>
 *
 * Example:
 * [bob, backpack] call ace_backpacks_fnc_onOpenInventory
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_backpack"];

// exit if the target is not a real backpack, i.e. parachute, static weapon bag etc.
if !(_backpack call FUNC(isBackpack)) exitWith {false};

// get the unit that wears the backpack object
private _target = objectParent _backpack;

if (isNull _target) exitWith {false};

// raise event on target unit
["ace_backpackOpened", [_target, _backpack], _target] call CBA_fnc_targetEvent;

// return false to open inventory as usual
false
