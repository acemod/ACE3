/**
 * fn_beingCarried.sqf
 * @Descr: Check if object is being carried
 * @Author: Glowbal
 *
 * @Arguments: [object OBJECT]
 * @Return: BOOL True if object is being carried
 * @PublicAPI: true
 */

private["_object"];
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
!(isNull ([_object] call cse_fnc_getCarriedObj));