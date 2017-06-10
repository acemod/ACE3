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
#include "script_component.hpp"

params ["_unit"];

alive _unit && {!(_unit getVariable [QEGVAR(medical,isUnconscious), false])}
