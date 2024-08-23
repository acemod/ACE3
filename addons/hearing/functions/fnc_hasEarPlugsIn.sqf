#include "..\script_component.hpp"
/*
 * Author: commy2
 * Check if the unit has earplugs put in.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has Earplugs in <BOOL>
 *
 * Example:
 * player call ace_hearing_fnc_hasEarPlugsIn
 *
 * Public: No
 */

params ["_unit"];

_unit getVariable ["ACE_hasEarPlugsin", false]
