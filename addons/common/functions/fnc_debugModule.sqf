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
private ["_entity"];
_entity = _this select 0;

GVAR(LOGDISPLAY_LEVEL) = call compile (_entity getvariable ["logDisplayLevel","4"]);
GVAR(LOGLEVEL) = call compile (_entity getvariable ["logLevel","4"]);
