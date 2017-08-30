/*
 * Author: commy2
 * Check if the unit has earplugs put in.
 *
 * Arguments:
 * 0: Unit (player) <OBJECT>
 *
 * Return Value:
 * Have Earplugs in <BOOL>
 *
 * Example:
 * [ace_player] call ace_hearing_fnc_hasEarPlugsIn
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit"];

_unit getVariable ["ACE_hasEarPlugsin", false]
