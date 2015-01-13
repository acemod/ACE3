/**
 * fn_performCPRLocal_CMS.sqf
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

[_unit] call cse_fnc_unitLoop_CMS;
/*if (([_unit, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable)) > 0) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
	[_caller,"No need for CPR"] call EFUNC(common,sendHintTo);
};*/

if (vehicle _unit == _unit) then {
	[_unit,"AinjPpneMstpSnonWrflDnon_rolltoback"] call EFUNC(common,localAnim);
};

if (vehicle _caller == _caller) then {
	//[_caller,"AinvPknlMstpSnonWrflDr_medic0"] call EFUNC(common,broadcastAnim);
	[_caller,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
};

[_this, "FUNC(performCPRProvider_CMS)", _caller, false] spawn BIS_fnc_MP;
_n = _unit getvariable ["CSE_ENABLE_REVIVE_COUNTER",0];
if (_n > 0) then {
	_n = _n - random(20);
	if (_n < 0) then {
		_n = 0;
	};
	_unit setvariable ["CSE_ENABLE_REVIVE_COUNTER", _n];
};