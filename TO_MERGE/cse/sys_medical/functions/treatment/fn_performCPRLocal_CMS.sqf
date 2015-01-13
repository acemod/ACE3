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
/*if (([_unit, "cse_heartRate"] call cse_fnc_getVariable) > 0) exitwith {
	[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
	[_caller,"No need for CPR"] call cse_fnc_sendHintTo;
};*/

if (vehicle _unit == _unit) then {
	[_unit,"AinjPpneMstpSnonWrflDnon_rolltoback"] call cse_fnc_localAnim;
};

if (vehicle _caller == _caller) then {
	//[_caller,"AinvPknlMstpSnonWrflDr_medic0"] call cse_fnc_broadcastAnim;
	[_caller,"AinvPknlMstpSlayWrflDnon_medic"] call cse_fnc_localAnim;
};

[_this, "cse_fnc_performCPRProvider_CMS", _caller, false] spawn BIS_fnc_MP;
_n = _unit getvariable ["CSE_ENABLE_REVIVE_COUNTER",0];
if (_n > 0) then {
	_n = _n - random(20);
	if (_n < 0) then {
		_n = 0;
	};
	_unit setvariable ["CSE_ENABLE_REVIVE_COUNTER", _n];
};