/**
 * fn_canCarryObj_LOG.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

#define MIN_DISTANCE	4

private ["_caller", "_object", "_log"];
_caller = _this select 0;
_object = _this select 1;

if (!(isNull ([_caller] call cse_fnc_getCarriedObj)) || !((_object distance _caller) < MIN_DISTANCE)) exitwith {
	false;
};

_log = (_object getvariable "CSE_Logistics_Enable");
if !(isnil "_log") exitwith {
	(_object getVariable ["CSE_Logistics_Enable", false])
};

false;