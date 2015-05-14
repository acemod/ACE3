/**
 * fn_isAwake.sqf
 * @Descr: Check if unit is awake. Will be false when death or unit is unconscious.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True if unit is awake
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit"];
_unit = _this select 0;
(!(_unit getvariable ["ACE_isUnconscious",false]) && alive _unit && !(_unit getvariable ["ACE_isDead",false]));
