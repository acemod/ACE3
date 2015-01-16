/**
 * fn_getCarriedBy.sqf
 * @Descr: Get the object that is carrying given unit or object
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: OBJECT Returns the object that is carrying the unit. Otherwise returns ObjNull
 * @PublicAPI: true
 */

	private ["_unit","_return"];
	_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_return = _unit getvariable ["cse_carriedBy",objNull];
_return
