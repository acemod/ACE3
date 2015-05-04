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

#include "script_component.hpp"

private ["_unit", "_magazine", "_previousMags", "_newMagName", "_newMags", "_magID"];
_unit = _this select 0;

if !(local _unit) exitwith {};

{
	[_unit, _x] call FUNC(checkItem);
}foreach items _unit;
