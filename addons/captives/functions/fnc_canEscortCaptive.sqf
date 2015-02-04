/*
 * Author: PabstMirror
 * Tests if can escort target (attach)
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT><OPTIONAL>
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

(_target getVariable [QGVAR(isCaptive), false]) && 
{isNull (attachedTo _target)} && 
{alive _target} && 
{!(_target getVariable [QGVAR(ACE_isUnconscious), false])}
