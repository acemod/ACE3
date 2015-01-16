/**
 * fn_isAwake.sqf
 * @Descr: Check if unit is awake. Will be false when death or unit is unconscious.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True if unit is awake
 * @PublicAPI: true
 */

private ["_unit","_return"];
_unit = _this select 0;
(!([_unit] call cse_fnc_isUnconscious)) && alive _unit && !(_unit getvariable ["cse_isDead",false]);
