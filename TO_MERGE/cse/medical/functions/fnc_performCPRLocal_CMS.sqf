/**
 * fn_performCPRLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_unit"];
_unit = _this select 0;
_caller = _this select 1;

[_unit] call FUNC(unitLoop_CMS);
if (vehicle _unit == _unit) then {
	[_unit,"AinjPpneMstpSnonWrflDnon_rolltoback"] call EFUNC(common,localAnim);
};

if (vehicle _caller == _caller) then {
	[_caller,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
};

[_this, QUOTE(FUNC(performCPRProvider_CMS)), _caller, false] spawn BIS_fnc_MP;
_n = _unit getvariable [QEGVAR(ENABLE_REVIVE_COUNTER),0];
if (_n > 0) then {
	_n = _n - random(20);
	if (_n < 0) then {
		_n = 0;
	};
	_unit setvariable [QEGVAR(ENABLE_REVIVE_COUNTER), _n];
};