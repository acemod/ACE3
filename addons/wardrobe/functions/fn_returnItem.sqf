#include "../script_component.hpp"

/*
* Author: Zorn
* Function to return an component to the player.
*
* Arguments:
*
* Return Value:
* boolean - was it successful?
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_unit", "_itemClassName"];

if !(_unit canAdd _itemClassName) exitWith { false };
_unit addItem _itemClassName;
true