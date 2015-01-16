/**
 * fn_checkBloodPressureLocal_CMS.sqf
 * @Descr: Displays specified units current blood pressure
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_unit","_bloodPressure","_bloodPressureHigh","_bloodPressureLow","_title","_content"];
_caller = _this select 0;
_unit = _this select 1;

_bloodPressure = [_unit] call FUNC(getBloodPressure_CMS);
if (!alive _unit) then {
	_bloodPressure = [0,0];
};

_bloodPressureHigh = _bloodPressure select 1;
_bloodPressureLow = _bloodPressure select 0;
_output = "";
_logOutPut = "";
if ([_caller] call FUNC(medicClass_CMS)) then {
	_output = "STR_ACE_CMS_CHECK_BLOODPRESSURE_OUTPUT_1";
	_logOutPut = format["%1/%2",round(_bloodPressureHigh),round(_bloodPressureLow)];
} else {
	if (_bloodPressureHigh > 20) then {
		_output = "STR_ACE_CMS_CHECK_BLOODPRESSURE_OUTPUT_2";
		_logOutPut = "Low";
		if (_bloodPressureHigh > 100) then {
			_output = "STR_ACE_CMS_CHECK_BLOODPRESSURE_OUTPUT_3";
			_logOutPut = "Normal";
			if (_bloodPressureHigh > 160) then {
				_output = "STR_ACE_CMS_CHECK_BLOODPRESSURE_OUTPUT_4";
				_logOutPut = "High";
			};

		};
	} else {
		if (random(10) > 3) then {
			_output = "STR_ACE_CMS_CHECK_BLOODPRESSURE_OUTPUT_5";
			_logOutPut = "No Blood Pressure";
		} else {
			_output = "STR_ACE_CMS_CHECK_BLOODPRESSURE_OUTPUT_6";
		};
	};
};

_title = format["STR_ACE_CMS_CHECK_BLOODPRESSURE"];
_content = ["STR_ACE_CMS_CHECK_BLOODPRESSURE_CHECKED_MEDIC", _output];
[_caller, _title, _content, 0,[[_unit] call EFUNC(common,getName), round(_bloodPressureHigh),round(_bloodPressureLow)] ] call EFUNC(common,sendDisplayInformationTo);

if (_logOutPut != "") then {
	[_unit,"examine",format["%1 checked Blood Pressure: %2",[_caller] call EFUNC(common,getName),_logOutPut]] call FUNC(addToQuickViewLog_CMS);
};