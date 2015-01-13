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

_return pushback  [localize "STR_ACE_ACTION_CHECK_PULSE","[_this select 1,_this select 0] call FUNC(checkPulse_CMS);",localize "STR_ACE_ACTION_CHECK_PULSE_TOOLTIP"];

_return pushback  [localize "STR_ACE_ACTION_CHECK_BP","[_this select 1,_this select 0] call FUNC(checkBloodPressure_CMS);",localize "STR_ACE_ACTION_CHECK_BP_TOOLTIP"];

_return pushback [localize "STR_ACE_ACTION_CHECK_RESPONSE","[_this select 1,_this select 0] call FUNC(checkResponse_CMS);",localize "STR_ACE_ACTION_CHECK_RESPONSE_TOOLTIP"];

_return = [GVAR(INTERACTION_TARGET), "getExamineOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);

_return