#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_unit"];

if !(local _unit) exitwith {};

{
    [_unit, _x] call FUNC(checkItem);
} foreach items _unit;
