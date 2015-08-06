/*
 * Author: Glowbal
 *
 * Check if unit is awake. Will be false when death or unit is unconscious.
 *
 * Argument:
 * 0: Unit (OBJECT)
 *
 * Return value:
 * if unit is awake (Bool)
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

(!(_unit getvariable ["ACE_isUnconscious",false]) && alive _unit && !(_unit getvariable ["ACE_isDead",false]));
