/*
 * Author: PabstMirror
 * Checks the conditions for being able to release a captive
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

//Unit is captive and not being escorted
_target getVariable [QGVAR(isCaptive), false] && 
{isNull (attachedTo _target)}
