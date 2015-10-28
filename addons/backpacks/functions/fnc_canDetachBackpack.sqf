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
(_unit getVariable [QGVAR(backpackProperties),nil]) params ["_backpackContent","_backpackClassname"];

(local _unit) &&
{alive _unit} &&
{!isNil "_backpackClassname"} &&
{(backpack _unit) != "ACE_ReserveParachute"};
