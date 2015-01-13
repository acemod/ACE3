/**
 * fn_moduleIsActive_f.sqf
 * @Descr: Check if given module name is active. DEPRICATED. DO NOT USE.
 * @Author: Glowbal
 *
 * @Arguments: [moduleName STRING]
 * @Return: BOOL Returns true if moduel is currently active
 * @PublicAPI: false
 */

private ["_moduleName","_return","_condition"];
_moduleName = _this select 0;
_return = false;

_condition = [_moduleNAme] call cse_fnc_getModuleCondition_F;
if (!isnil "_condition") then {
	call compile format["_return = %1;",_condition];
};
_return