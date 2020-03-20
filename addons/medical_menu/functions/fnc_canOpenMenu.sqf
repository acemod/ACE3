#include "script_component.hpp"
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
 * [player, cursorTarget] call ace_medical_menu_fnc_canOpenMenu
 *
 * Public: No
 */

params ["_caller", "_target"];

(alive _caller)
&& {!isNull _target}
&& {((_caller distance _target) < GVAR(maxRange)) || {(vehicle _caller) == (vehicle _target)}} //for now, ignore range when in same vehicle
&& {(GVAR(allow) == 1) || {(GVAR(allow) == 2) && {(vehicle _caller != _caller) || {vehicle _target != _target}}}}
&& {(GVAR(useMenu) == 1) || {(GVAR(useMenu) == 2) && {(vehicle _caller != _caller) || {vehicle _target != _target}}}}
