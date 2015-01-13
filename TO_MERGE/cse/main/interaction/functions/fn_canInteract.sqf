/**
 * fn_canInteract.sqf
 * @Descr: Check if unit can interact with enviroment. Unit has to be awake and not be in arrested state.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True if unit can interact with enviroment.
 * @PublicAPI: true
 */

private ["_unit","_return"];
_unit = _this select 0;
(((_unit getvariable ["cse_canInteract",0]) < 1) && ([_unit] call cse_fnc_isAwake) && !([_unit] call cse_fnc_isArrested))