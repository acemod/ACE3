/**
 * fn_checkBloodPressure_CMS.sqf
 * @Descr: Displays specified units current blood pressure
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_caller","_unit","_bloodPressure","_bloodPressureHigh","_bloodPressureLow"];
_caller = _this select 0;
_unit = _this select 1;

if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_caller] call cse_fnc_treatmentMutex_CMS;
_title = format["STR_CSE_CMS_CHECK_BLOODPRESSURE"];
_content = ["STR_CSE_CMS_CHECK_BLOODPRESSURE_CONTENT"];
[_caller, _title, _content] call cse_fnc_sendDisplayInformationTo;


CSE_ORIGINAL_POSITION_PLAYER_CMS = getPos _caller;
if !([(2 + round(random(4))),{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER_CMS) < 1)}, {},{[player, "STR_CSE_CMS_CANCELED", ["STR_CSE_CMS_ACTION_CANCELED","STR_CSE_CMS_YOU_MOVED_AWAY"]] call cse_fnc_sendDisplayInformationTo;}] call cse_fnc_gui_loadingBar) exitwith {
		[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
};

[_this, "cse_fnc_checkBloodPressureLocal_CMS", _unit, false] spawn BIS_fnc_MP;
[_caller,"release"] call cse_fnc_treatmentMutex_CMS;