/**
 * fn_getCanInteract.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_return"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
(_unit getvariable ["cse_canInteract",0])