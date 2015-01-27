/**
 * fnc_moduleDamageSettings.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_logic","_setting","_objects"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (!isNull _logic) then {
	GVAR(damageThreshold_AI) = _logic getvariable ["damageThresholdAI", 1];
	GVAR(damageThreshold_Players) = _logic getvariable ["damageThresholdPlayers", 1];
};

true