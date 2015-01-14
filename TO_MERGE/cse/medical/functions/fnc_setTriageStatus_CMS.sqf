/**
 * fn_setTriageStatus_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_caller","_type","_activity","_status"];

_unit = _this select 0;
_status = _this select 1;

if (!local _unit) exitwith {
	[_this, QUOTE(FUNC(setTriageStatus_CMS)), _unit, false] spawn BIS_fnc_MP;
};
[_unit,QGVAR(triageLevel),_status] call EFUNC(common,setDefinedVariable);