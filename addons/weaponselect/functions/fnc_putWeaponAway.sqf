/*
 * Author: commy2
 *
 * The unit will put its current weapon away.
 *
 * Argument:
 * 0: What unit should put the current weapon on back? (Object)
 *
 * Return value:
 * None.
 */
#include "script_component.hpp"

PARAMS_1(_unit);

[_unit] call EFUNC(common,fixLoweredRifleAnimation);

_unit action ["SwitchWeapon", _unit, _unit, 99];
