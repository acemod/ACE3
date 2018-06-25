#include "script_component.hpp"
/*
 * Author: bux578
 * Checks the conditions for being able to frisk a unit
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canFriskPerson
 *
 * Public: No
 */

params ["_unit", "_target"];

_target getVariable [QGVAR(isHandcuffed), false]
|| {_target getVariable [QGVAR(isSurrendering), false]}
|| {_target getVariable ["ACE_isSearchable", false]}
|| {_target getVariable ["ACE_isUnconscious", false]}
