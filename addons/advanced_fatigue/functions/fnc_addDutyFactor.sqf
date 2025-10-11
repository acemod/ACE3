#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Adds a duty factor.
 *
 * Arguments:
 * 0: Factor ID <STRING>
 * 1: Factor <NUMBER or CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ID", 5] call ace_advanced_fatigue_fnc_addDutyFactor
 *
 * Public: No
 */
params [["_id", "", [""]], ["_factor", 1, [0, {}]]];
if (_id == "" || {_factor isEqualTo 1}) exitWith {};

GVAR(dutyList) set [_id, _factor];
