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

[_unit, QGVAR(heartRate),40] call EFUNC(common,setDefinedVariable);
[_unit, QGVAR(bloodPressure),[50,70]] call EFUNC(common,setDefinedVariable);

// setting this to waken up unconscious revivable units
[_unit, QEGVAR(common,ENABLE_REVIVE_SETDEAD_F), 0] call EFUNC(common,setDefinedVariable);
[_unit, "CSE_ENABLE_REVIVE_COUNTER", 0] call EFUNC(common,setDefinedVariable);
