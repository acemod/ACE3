/**
 * fn_cleanUpCopyOfBody_f.sqf
 * @Descr: Called from a custom eventhandler to ensure that any copies of bodies are cleaned up.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_unit", "_copy"];
_unit = _this select 0;

_copy = _unit getvariable "cse_copyOfBody_f";
if (isnil "_copy") exitwith {false};
[format["Cleaning up a copy of Body: %1 %2", _unit, _copy]] call cse_fnc_debug;
// lets clean it up
_unit setvariable ["cse_originalCopy_f", nil, true];
_unit setvariable ["cse_copyOfBody_f", nil, true];
if (!isNull _copy) then {
	deleteVehicle _copy;
};

true;