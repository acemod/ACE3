/*
 * Author: Glowbal
 *
 * Check if unit is awake. Will be false when death or unit is unconscious.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * if unit is awake <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

!(_unit getvariable ["ACE_isUnconscious", false]) && alive _unit && !(_unit getvariable ["ACE_isDead", false]);
