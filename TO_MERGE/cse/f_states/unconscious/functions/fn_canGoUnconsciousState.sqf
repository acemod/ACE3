/**
 * fn_canGoUnconsciousState.sqf
 * @Descr: Checks if an object can move into unconscious state
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL true if object can move into unconscious state
 * @PublicAPI: true
 */

private ["_unit"];
_unit = _this select 0;

(!(isNull _unit) && {(_unit isKindOf "CaManBase") && ([_unit] call cse_fnc_isAwake)})