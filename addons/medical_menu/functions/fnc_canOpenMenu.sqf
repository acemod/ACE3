/*
 * Author: Glowbal
 * Check if ACE_player can Open the medical menu
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can open <BOOL>
 *
 * Example:
 * [] call ace_medical_menu_canOpenMenu
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target"];

if !(GVAR(allow) == 1 || (GVAR(allow) == 2 && {vehicle _caller != _caller || vehicle _target != _target} && {alive ACE_player})) exitWith {false};
if !(GVAR(useMenu) == 1 || (GVAR(useMenu) == 2 && {vehicle _caller != _caller || vehicle _target != _target} && {alive ACE_player})) exitWith {false};

true
