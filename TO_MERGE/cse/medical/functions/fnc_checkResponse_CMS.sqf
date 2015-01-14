/**
 * fn_checkResponse_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_unit"];
_caller = _this select 0;
_unit = _this select 1;

if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_caller] call FUNC(treatmentMutex_CMS);
_title = format["STR_ACE_CMS_CHECK_RESPONSE"];
_content = ["STR_ACE_CMS_CHECK_RESPONSE_CONTENT"];
[_caller, _title, _content] call EFUNC(common,sendDisplayInformationTo);


GVAR(ORIGINAL_POSITION_PLAYER) = getPos _caller;
if !([(2 + round(random(4))),{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{[player, "STR_ACE_CMS_CANCELED", ["STR_ACE_CMS_ACTION_CANCELED","STR_ACE_CMS_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);}] call EFUNC(gui,loadingBar)) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
};

_output = "";
if ([_unit] call EFUNC(common,isAwake)) then {
	_output = format[localize "STR_ACE_CMS_CHECK_REPONSE_RESPONSIVE",[_unit] call EFUNC(common,getName)];
} else {
	_output = format[localize "STR_ACE_CMS_CHECK_REPONSE_UNRESPONSIVE",[_unit] call EFUNC(common,getName)];
};

_title = format["STR_ACE_CMS_CHECK_RESPONSE"];
_content = [format[localize "STR_ACE_CMS_CHECK_REPONSE_YOU_CHECKED",[_unit] call EFUNC(common,getName)],_output];
[_caller, _title, _content] call EFUNC(common,sendDisplayInformationTo);

[_unit,"examine",_output] call FUNC(addToQuickViewLog_CMS);
[_caller,"release"] call FUNC(treatmentMutex_CMS);