/**
 * fn_checkResponse_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_caller","_unit"];
_caller = _this select 0;
_unit = _this select 1;

if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_caller] call cse_fnc_treatmentMutex_CMS;
_title = format["STR_CSE_CMS_CHECK_RESPONSE"];
_content = ["STR_CSE_CMS_CHECK_RESPONSE_CONTENT"];
[_caller, _title, _content] call cse_fnc_sendDisplayInformationTo;


CSE_ORIGINAL_POSITION_PLAYER_CMS = getPos _caller;
if !([(2 + round(random(4))),{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER_CMS) < 1)}, {},{[player, "STR_CSE_CMS_CANCELED", ["STR_CSE_CMS_ACTION_CANCELED","STR_CSE_CMS_YOU_MOVED_AWAY"]] call cse_fnc_sendDisplayInformationTo;}] call cse_fnc_gui_loadingBar) exitwith {
	[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
};

_output = "";
if ([_unit] call cse_fnc_isAwake) then {
	_output = format[localize "STR_CSE_CMS_CHECK_REPONSE_RESPONSIVE",[_unit] call cse_fnc_getName];
} else {
	_output = format[localize "STR_CSE_CMS_CHECK_REPONSE_UNRESPONSIVE",[_unit] call cse_fnc_getName];
};

_title = format["STR_CSE_CMS_CHECK_RESPONSE"];
_content = [format[localize "STR_CSE_CMS_CHECK_REPONSE_YOU_CHECKED",[_unit] call cse_fnc_getName],_output];
[_caller, _title, _content] call cse_fnc_sendDisplayInformationTo;

[_unit,"examine",_output] call cse_fnc_addToQuickViewLog_CMS;
[_caller,"release"] call cse_fnc_treatmentMutex_CMS;