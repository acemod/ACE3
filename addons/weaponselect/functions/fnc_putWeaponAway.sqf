/*
 * Author: commy2
 *
 * The unit will put its current weapon away.
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

params ["_unit"];

[_unit] call EFUNC(common,fixLoweredRifleAnimation);

_unit action ["SwitchWeapon", _unit, _unit, 99];
