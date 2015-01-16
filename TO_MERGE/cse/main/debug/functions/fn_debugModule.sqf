/**
 * fn_debugModule.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_entity"];
_entity = _this select 0;

CSE_LOGDISPLAY_LEVEL = call compile (_entity getvariable ["logDisplayLevel","4"]);
CSE_LOGLEVEL = call compile (_entity getvariable ["logLevel","4"]);
