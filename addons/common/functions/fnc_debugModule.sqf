#include "script_component.hpp"
/*
 * Author: Glowbal
 * ?
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_common_fnc_debugModule
 *
 * Public: No
 */

params ["_entity"];

GVAR(LOGDISPLAY_LEVEL) = call compile (_entity getVariable ["logDisplayLevel","4"]);
GVAR(LOGLEVEL) = call compile (_entity getVariable ["logLevel","4"]);
