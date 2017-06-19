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
 * Example:
 * [bob, kevin] call ACE_interaction_fnc_pardon
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_target"];

[QGVAR(pardon), [_target], [_target]] call CBA_fnc_targetEvent;
