/**
 * fn_canDragObj_LOG.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

#define MIN_DISTANCE	4

private ["_caller", "_object", "_check"];
_caller = _this select 0;
_object = _this select 1;

if (!(isNull ([_caller] call cse_fnc_getCarriedObj)) || !((_object distance _caller) < MIN_DISTANCE)) exitwith {
	false;
};

_check = _object getvariable "CSE_Logistics_Enable_drag";
if !(isnil "_check") exitwith {
	_check;
};

((_object iskindof "StaticWeapon") || ((_object iskindof "ReammoBox") || (_object iskindof "ReammoBox_F")));