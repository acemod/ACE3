/*
 * Author: PabstMirror
 * Checks the conditions for being able to apply handcuffs
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canApplyHandcuffs
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_target);

//Player has cableTie, target is alive and not already handcuffed

("ACE_CableTie" in (items _unit)) &&
{alive _target} &&
{!(_target getVariable [QGVAR(isHandcuffed), false])}
