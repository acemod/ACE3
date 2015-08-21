/*
 * Author: commy2
 *
 * Returns the unit that has the given backpack object equipped.
 *
 * Argument:
 * 0: Executing Unit (Object)
 * 1: A backpack object (Object)
 *
 * Return value:
 * Unit that has the backpack equipped. (Object)
 */
#include "script_component.hpp"
scopeName "main";

params ["_unit","_backpack"];
_target = objNull;
{
    if (backpackContainer _x == _backpack) then {_target = _x; breakTo "main"};
} count nearestObjects [_unit, ["Man"], 5];
if (isNull _target) exitWith {ACE_Player};
_target
