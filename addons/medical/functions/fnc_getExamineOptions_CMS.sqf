/**
 * fn_getExamineOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_return"];
_return = [];

_return pushback  [localize "STR_ACE_ACTION_CHECK_PULSE",QUOTE([ARR_2(_this select 1,_this select 0)] call FUNC(checkPulse_CMS);),localize "STR_ACE_ACTION_CHECK_PULSE_TOOLTIP"];
_return pushback  [localize "STR_ACE_ACTION_CHECK_BP",QUOTE([ARR_2(_this select 1,_this select 0)] call FUNC(checkBloodPressure_CMS);),localize "STR_ACE_ACTION_CHECK_BP_TOOLTIP"];
_return pushback [localize "STR_ACE_ACTION_CHECK_RESPONSE",QUOTE([ARR_2(_this select 1,_this select 0)] call FUNC(checkResponse_CMS);),localize "STR_ACE_ACTION_CHECK_RESPONSE_TOOLTIP"];
_return = [GVAR(INTERACTION_TARGET), "getExamineOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);

_return