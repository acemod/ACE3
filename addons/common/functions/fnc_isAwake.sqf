#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if unit is awake. Will be false when death or unit is unconscious.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * if unit is awake <BOOL>
 *
 * Example:
 * [bob] call ace_common_fnc_isAwake
 *
 * Public: Yes
 */

params ["_unit"];

alive _unit && {!(_unit getVariable ["ACE_isUnconscious", false])}
