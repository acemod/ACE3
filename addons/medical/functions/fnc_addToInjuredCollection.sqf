/*
 * Author: Glowbal
 * Enabled the vitals loop for a unit. Deprecated!
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_medical_fnc_addToInjuredCollection
 *
 * Public: No
 */

#include "script_component.hpp"

ACE_DEPRECATED("ace_medical_fnc_addToInjuredCollection","3.7.0","ace_medical_fnc_addVitalLoop");

_this call FUNC(addVitalLoop);
