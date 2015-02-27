/*
 * Author: PabstMirror
 * Checks the conditions for being able to disarm a unit
 *
 * Arguments:
 * 0: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [cursorTarget] call ace_disarming_fnc_canDisarm
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_target);

(alive _target) &&
{(abs (speed _target)) < 0.1} &&
{(_target getVariable ["ACE_isUnconscious", false]) ||
    {_target getVariable [QEGVAR(captives,isHandcuffed), false]} ||
    {_target getVariable [QEGVAR(captives,isSurrendering), false]}}
    