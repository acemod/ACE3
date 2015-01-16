/**
 * fn_traceModule.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_entity"];
_entity = _this select 0;

_enableForPlayer = call compile (_entity getvariable ["logDisplayLevel","0"]);
if (isnil "CSE_OBJECTS_TRACING") then {
	CSE_OBJECTS_TRACING = [];
};

if (!isDedicated) then {
	if (_enableForPlayer==1) then {
		CSE_OBJECTS_TRACING set [count CSE_OBJECTS_TRACING, PLAYER];
	};
};