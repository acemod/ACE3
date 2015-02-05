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
 * -
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_target);

_target getVariable [QGVAR(isHandcuffed), false]
|| {_target getVariable ["ACE_isSearchable", false]}
|| {_target getVariable ["ACE_isUnconscious", false]}
