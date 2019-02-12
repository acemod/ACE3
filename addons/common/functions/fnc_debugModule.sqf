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

GVAR(LOGDISPLAY_LEVEL) = (parseSimpleArray format ["[%1]", _entity getVariable ["logDisplayLevel","4"]]) select 0;
GVAR(LOGLEVEL) = (parseSimpleArray format ["[%1]", _entity getVariable ["logLevel","4"]]) select 0;
