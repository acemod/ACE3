/**
 * fn_moduleEnableBasicRevive.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_args", "_units", "_activated"];
_args = _this;

CSE_ENABLE_REVIVE_F = 0;
CSE_REVIVE_TIMER_F = 600;
CSE_REVIVE_NUMBER_MAX_F = -1;
{
	_value = _x select 1;
	if (!isnil "_value") then {
		if (_x select 0 == "enableFor") then {
			CSE_ENABLE_REVIVE_F = _x select 1;
		};
		if (_x select 0 == "timer") then {
			CSE_REVIVE_TIMER_F = _x select 1;
		};
		if (_x select 0 == "amountOf") then {
			CSE_REVIVE_NUMBER_MAX_F = _x select 1;
		};
	};
}foreach _args;

[
	{(((_this select 0) getvariable["CSE_ENABLE_REVIVE_SETDEAD_F",0]) > 0)}
] call cse_fnc_registerUnconsciousCondition;

[format["Enabled Basic Revive Module - ENABLED FOR: %1. TIMER: %2. NUMBER: %3", CSE_ENABLE_REVIVE_F, CSE_REVIVE_TIMER_F, CSE_REVIVE_NUMBER_MAX_F]] call cse_fnc_debug;