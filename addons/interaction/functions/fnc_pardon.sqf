/*
 * Author: commy2
 * Unit pardons target unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_target"];

["pardon", [_target], [_target]] call EFUNC(common,targetEvent);
