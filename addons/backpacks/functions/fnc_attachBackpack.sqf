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

_backpackClassname = backpack _unit;
_backpackContent = backpackItems _unit;

removeBackpack _unit;

[_unit,"BackpackOnFront",true] call EFUNC(common,setForceWalkStatus);

_unit setVariable [QGVAR(backpackProperties), [_backpackContent,_backpackClassname]];
