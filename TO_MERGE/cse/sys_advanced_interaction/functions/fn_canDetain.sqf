/**
 * fn_canDetain.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target", "_caller"];
_caller = _this select 0;
_target = _this select 1;


([_caller, _target, CSE_DETAIN_SETTING_AIM, "cse_Keycuffs"] call cse_fnc_canPerformAction_AIM) && !([_target] call cse_fnc_isArrested);