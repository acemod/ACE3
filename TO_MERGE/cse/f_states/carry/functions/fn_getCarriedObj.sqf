/**
 * fn_getCarriedObj.sqf
 * @Descr: Grab the registered carried object
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: OBJECT Returns the object that the unit is currently carrying. If not carrying, returns ObjNull
 * @PublicAPI: true
 */

	private ["_unit","_return"];
	_unit = _this select 0;
	_return = _unit getvariable ["cse_carriedObj",objNull];
_return
