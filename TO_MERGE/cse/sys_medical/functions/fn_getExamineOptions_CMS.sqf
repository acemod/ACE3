/**
 * fn_getExamineOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return"];
_return = [];

_return pushback  [localize "STR_CSE_ACTION_CHECK_PULSE","[_this select 1,_this select 0] call cse_fnc_checkPulse_CMS;",localize "STR_CSE_ACTION_CHECK_PULSE_TOOLTIP"];

_return pushback  [localize "STR_CSE_ACTION_CHECK_BP","[_this select 1,_this select 0] call cse_fnc_checkBloodPressure_CMS;",localize "STR_CSE_ACTION_CHECK_BP_TOOLTIP"];

_return pushback [localize "STR_CSE_ACTION_CHECK_RESPONSE","[_this select 1,_this select 0] call cse_fnc_checkResponse_CMS;",localize "STR_CSE_ACTION_CHECK_RESPONSE_TOOLTIP"];

_return = [CSE_SYS_MEDICAL_INTERACTION_TARGET, "getExamineOptions_CMS", _return] call cse_fnc_getOptionsForCategory_CMS;

_return