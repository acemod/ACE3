/**
 * fn_performCPRSuccess_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_caller","_unit"];
_unit = _this select 0;
_caller = _this select 1;

[_unit, "cse_heartRate",40] call cse_fnc_setVariable;
[_unit, "cse_bloodPressure",[50,70]] call cse_fnc_setVariable;

// setting this to waken up unconscious revivable units
[_unit, "CSE_ENABLE_REVIVE_SETDEAD_F", 0] call cse_fnc_setVariable;
[_unit, "CSE_ENABLE_REVIVE_COUNTER", 0] call cse_fnc_setVariable;
