/**
 * fn_disableAI_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_disable"];
_unit = [_this, 0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_disable = [_this, 1,false,[false]] call BIS_fnc_Param;

if (local _unit && !(IsPlayer _unit)) then {
	if (_disable) then {
		_unit disableAI "Move";
		_unit disableAI "TARGET";
	} else {
		_unit enableAI "Move";
		_unit enableAI "TARGET";
	};
};