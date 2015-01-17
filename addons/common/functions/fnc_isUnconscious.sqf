/**
 * fn_isUnconscious.sqf
 * @Descr: Checks whatever given object is in the unconscious state
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True when object is in unconscious state
 * @PublicAPI: true
 */

#include "script_component.hpp"

((_this select 0) getvariable ["ACE_isUnconscious",false]);