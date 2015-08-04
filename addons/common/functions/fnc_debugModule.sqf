/**
 * fn_debugModule.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

params ["_entity"];

GVAR(LOGDISPLAY_LEVEL) = call compile (_entity getvariable ["logDisplayLevel","4"]);
GVAR(LOGLEVEL) = call compile (_entity getvariable ["logLevel","4"]);
