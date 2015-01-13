/*
functions.sqf
Usage: compileFinals the function SQF files into variables for use
Author: Glowbal

Arguments: none
Returns: none

Affects: n/a
Executes:
*/

cse_fnc_unitLoop_CMS = {
	_unit = _this select 0;
	if !(local _unit) exitwith{};
	if !(_unit getvariable["cse_fnc_unitLoop_CMS",false]) then{
		_unit setvariable ["cse_fnc_unitLoop_CMS",true];
	};

	if ([_unit] call cse_fnc_hasMedicalEnabled_CMS) then {
		if (isnil "CSE_MEDICAL_COMBINED_LOOP_CMS") then {
			CSE_MEDICAL_COMBINED_LOOP_CMS = [];
		};
		if (_unit in CSE_MEDICAL_COMBINED_LOOP_CMS) exitwith {};
		CSE_MEDICAL_COMBINED_LOOP_CMS pushback _unit;
		[format["Added %1 to unitLoop",_unit]] call cse_fnc_debug;
	};
};

cse_fnc_onBodySwitch_CMS = {
	private ["_unit","_newUnit"];
	_unit = _this select 0;
	_newUnit = _this select 1;
	if (!dialog) exitwith{};
	if (CSE_SYS_MEDICAL_INTERACTION_TARGET == _unit) then {
		CSE_SYS_MEDICAL_INTERACTION_TARGET = _newUnit;
	};
};

cse_eh_killed_CMS = {
	private["_unit"];
	_unit = _this select 0;
	if (!local _unit) exitwith {};
	[_unit, "cse_pain",0,true] call cse_fnc_setVariable;
	[_unit, "cse_heartRate",0,true] call cse_fnc_setVariable;
	[_unit, "cse_bloodPressure", [0,0],true] call cse_fnc_setVariable;
	if (_unit getvariable["cse_unconscious_non_captive_f",false]) then {
		_unit setCaptive false;
		_unit setvariable["cse_unconscious_non_captive_f",nil];
	};
};

cse_eh_local_CMS = {
	private["_unit"];
	_unit = _this select 0;
	_local = _this  select 1;
	[format["Locality changed for: %1",_this]] call cse_fnc_Debug;
	if (_local) then {
		if (_unit getvariable["cse_fnc_unitLoop_CMS",false]) then {
			[_unit] call cse_fnc_unitLoop_CMS;
		};
	} else {

	};
};
