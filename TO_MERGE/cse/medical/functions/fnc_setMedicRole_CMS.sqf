/**
 * fn_setMedicRole_CMS.sqf
 * @Descr: Register a unit as a medic
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (Any unit of type CAManBase), value NUMBER (0 is normal. 1 or above is medic)]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit","_value"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_value = [_this, 1, false,[false]] call BIS_fnc_param;

if (_unit isKindOf "CaManBase") then {
	if (_value) then {
		_unit setvariable [QGVAR(medicClass),1,true];
	};
};