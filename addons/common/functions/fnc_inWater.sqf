/*
 * Author: Glowbal
 * Check if unit's head is underwater
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * If unit's head is underwater <BOOL>
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

ACE_DEPRECATED("ace_common_fnc_inWater","3.5.0","ace_common_fnc_isUnderwater");

_this call FUNC(isUnderwater)
