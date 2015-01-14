/**
 * fn_performCPRProvider_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_unit","_timer","_succesValueCPR"];
_unit = _this select 0;
_caller = _this select 1;

GVAR(playerIsProvidingCPR) = true;
_timer = 0;
_succesValueCPR = 0;

[_caller,"You start providing CPR"] call EFUNC(common,sendHintTo);

while {GVAR(playerIsProvidingCPR)} do {
	// [_caller,"Acts_TreatingWounded01"] call EFUNC(common,localAnim);
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
	if (_succesValueCPR > 20 && ((_unit getvariable [QEGVAR(common,ENABLE_REVIVE_SETDEAD_F),0]) == 0)) exitwith {
		_succesValueCPR = 40;
	};
	if (_succesValueCPR > 35 && ((_unit getvariable [QEGVAR(common,ENABLE_REVIVE_SETDEAD_F),0]) > 0)) exitwith {
		_succesValueCPR = 40;
	};

	if (_timer > 160) exitwith{_succesValueCPR = 0;};
};
GVAR(playerIsProvidingCPR) = nil;
if (vehicle _caller == _caller) then {
	[_caller,"AinvPknlMstpSnonWrflDnon_medicEnd"] call EFUNC(common,localAnim);
};

[_caller,"release"] call FUNC(treatmentMutex_CMS);
if (_succesValueCPR > 20 && alive _unit) then {
	_unit setvariable [QGVAR(inCardiacArrest), nil, true];
	[_caller,"CPR Success"] call EFUNC(common,sendHintTo);
	[_this, QUOTE(FUNC(performCPRSuccess_CMS)), _unit, false] spawn BIS_fnc_MP;
} else {
	[_caller,"You stopped giving CPR"] call EFUNC(common,sendHintTo);
};