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

_unit removeItem 'ACE_CableTie';  
["SetCaptive", [_target], [_target, true]] call EFUNC(common,targetEvent);
