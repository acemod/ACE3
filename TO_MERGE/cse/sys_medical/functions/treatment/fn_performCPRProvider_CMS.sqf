/**
 * fn_performCPRProvider_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_caller","_unit","_timer","_succesValueCPR"];
_unit = _this select 0;
_caller = _this select 1;

cse_playerIsProvidingCPR_CMS = true;
_timer = 0;
_succesValueCPR = 0;

[_caller,"You start providing CPR"] call cse_fnc_sendHintTo;

while {cse_playerIsProvidingCPR_CMS} do {
	// [_caller,"Acts_TreatingWounded01"] call cse_fnc_localAnim;
	if (vehicle _caller == _caller) then {
		_caller playMove "AinvPknlMstpSnonWrflDr_medic0";
	};
	sleep 0.1;
	if (alive _unit) then {
		if (random(10) > 6) then {
			_succesValueCPR = _succesValueCPR + random(2);
		} else {
			_succesValueCPR = _succesValueCPR - random(1);
			if (_succesValueCPR < 0) then {
				_succesValueCPR = 0;
			};
		};
	};
	_timer = _timer + 1;
	sleep 0.1;
	if (_succesValueCPR > 20 && ((_unit getvariable ["CSE_ENABLE_REVIVE_SETDEAD_F",0]) == 0)) exitwith {
		_succesValueCPR = 40;
	};
	if (_succesValueCPR > 35 && ((_unit getvariable ["CSE_ENABLE_REVIVE_SETDEAD_F",0]) > 0)) exitwith {
		_succesValueCPR = 40;
	};

	if (_timer > 160) exitwith{_succesValueCPR = 0;};
};
cse_playerIsProvidingCPR_CMS = nil;
if (vehicle _caller == _caller) then {
	[_caller,"AinvPknlMstpSnonWrflDnon_medicEnd"] call cse_fnc_localAnim;
};

[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
if (_succesValueCPR > 20 && alive _unit) then {
	_unit setvariable ["cse_cardiacArrest_CMS", nil, true];
	[_caller,"CPR Success"] call cse_fnc_sendHintTo;
	[_this, "cse_fnc_performCPRSuccess_CMS", _unit, false] spawn BIS_fnc_MP;
} else {
	[_caller,"You stopped giving CPR"] call cse_fnc_sendHintTo;
};