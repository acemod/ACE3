/*
* Author: alganthe
*
*
* Arguments:
*
*
* Return Value:
*
*
* Public:
*/
#include "script_component.hpp"

params ["_unit"];

(_unit getVariable QGVAR(backpackProperties)) params ["_backpackContent","_backpackClass"];

_unit addBackpack _backpackClass;

{
    _unit addItemToBackpack _x;
} forEach _backpackContent;

[_unit,"BackpackOnFront",false] call EFUNC(common,setForceWalkStatus);
_unit setVariable [QGVAR(backpackProperties),nil];
