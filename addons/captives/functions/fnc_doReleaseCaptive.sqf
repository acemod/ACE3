/*
 * Author: PabstMirror
 * Release a captive
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

["SetCaptive", [_target], [_target, false]] call EFUNC(common,targetEvent);
