/**
 * fn_findTargetName_gui.sqf
 * @Descr: Get the target name
 * @Author: Glowbal
 *
 * @Arguments: [target OBJECT]
 * @Return: STRING name of Target
 * @PublicAPI: true
 */

private ["_target","_targetName"];
_target = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_Param;

_targetName = switch (true) do {
	case (_target isKindOf "CaManBase"): {([_target] call cse_fnc_getName)};
	case ((_target isKindOf "All")): {(getText(configFile >> "Cfgvehicles" >> typeof _target >> "displayName"))};
	default {"Object"};
};

_targetName