/**
 * fn_hideObjCargo_LOG.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_obj","_veh"];
_obj = _this select 0;
_veh = _this select 1;
_hide = _this select 2;

if (_hide) then {
	_obj enableSimulation false;
	_obj hideObject true;
} else {
	_obj enableSimulation true;
	_obj hideObject false;
};