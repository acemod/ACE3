/*
 * Author: PabstMirror
 * Checks the conditions for being able to take a unit captive
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

("ACE_CableTie" in (items _unit)) && 
{alive _target} && 
{!(_target getVariable [QGVAR(isCaptive), false])}
