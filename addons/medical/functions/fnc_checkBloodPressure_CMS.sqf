/**
 * fn_checkBloodPressure_CMS.sqf
 * @Descr: Displays specified units current blood pressure
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_unit","_bloodPressure","_bloodPressureHigh","_bloodPressureLow"];
_caller = _this select 0;
_unit = _this select 1;

if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_caller] call FUNC(treatmentMutex_CMS);
_title = format["STR_ACE_CMS_CHECK_BLOODPRESSURE"];
_content = ["STR_ACE_CMS_CHECK_BLOODPRESSURE_CONTENT"];
[_caller, _title, _content] call EFUNC(common,sendDisplayInformationTo);


GVAR(ORIGINAL_POSITION_PLAYER) = getPos _caller;
if !([(2 + round(random(4))),{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{[player, "STR_ACE_CMS_CANCELED", ["STR_ACE_CMS_ACTION_CANCELED","STR_ACE_CMS_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);}] call EFUNC(gui,loadingBar)) exitwith {
		[_caller,"release"] call FUNC(treatmentMutex_CMS);
};

[_this, QUOTE(FUNC(checkBloodPressureLocal_CMS)), _unit, false] call BIS_fnc_MP;
[_caller,"release"] call FUNC(treatmentMutex_CMS);