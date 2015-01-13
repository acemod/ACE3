/**
 * fn_setCarriedBy.sqf
 * @Descr: Registers an object being carried by another object
 * @Author: Glowbal
 *
 * @Arguments: [unitToBeCarried OBJECT, objectCarrying OBJECT]
 * @Return: BOOL	True if succesfully registered
 * @PublicAPI: false
 */


private ["_unit","_to","_return"];
_unit = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_to = [_this, 1, ObjNull,[ObjNull]] call BIS_fnc_Param;
_return = false;
if ((isNull ([_unit] call FUNC(getCarriedBy))) || isNull _to) then {
	_return = true;
	_unit setvariable [QGVAR(carriedBy),_to,true];
};
_return