/*
 * Author: ACE
 * Not currently used
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Args <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, [args]] call ace_missileguidance_fnc_doHandoff
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_target", "_args"];

[QGVAR(handoff), [_target, _args]] call CBA_fnc_globalEvent;
