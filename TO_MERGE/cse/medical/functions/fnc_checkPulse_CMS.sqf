/**
 * fn_checkPulse_CMS.sqf
 * @Descr: Displays specified units current pulse
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_caller","_unit","_title","_content"];
_caller = _this select 0;
_unit = _this select 1;

if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_caller] call FUNC(treatmentMutex_CMS);
_title = format["STR_ACE_CMS_CHECK_PULSE"];
_content = ["STR_ACE_CMS_CHECK_PULSE_CONTENT"];
[_caller, _title, _content] call EFUNC(common,sendDisplayInformationTo);



GVAR(ORIGINAL_POSITION_PLAYER) = getPos _caller;
if !([(2 + round(random(4))),{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{[player, "STR_ACE_CMS_CANCELED", ["STR_ACE_CMS_ACTION_CANCELED","STR_ACE_CMS_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);}] call EFUNC(gui,loadingBar)) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
};

[_this, "FUNC(checkPulseLocal_CMS)", _unit, false] spawn BIS_fnc_MP;

[_caller,"release"] call FUNC(treatmentMutex_CMS);