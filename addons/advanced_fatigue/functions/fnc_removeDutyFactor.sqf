#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Removes a duty factor.
 *
 * Arguments:
 * 0: Factor ID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ID"] call ace_advanced_fatigue_fnc_removeDutyFactor
 *
 * Public: No
 */
params [["_id", "", [""]]];

GVAR(dutyList) deleteAt _id;
