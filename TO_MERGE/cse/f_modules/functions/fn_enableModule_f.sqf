/**
 * fn_enableModule_f.sqf
 * @Descr: Enable a CSE Module
 * @Author: Glowbal
 *
 * @Arguments: [moduleName STRING, arguments ARRAY (Format: [[name STRING, value ANY]])]
 * @Return:  void
 * @PublicAPI: true
 */

private ["_moduleName", "_arguments", "_moduleInfo"];
_moduleName = _this select 0;
_arguments = _this select 1;

[format["enableModule_f %1 %2",_this,  ([_moduleName] call cse_fnc_isModuleEnabled_F)]] call cse_fnc_debug;
if ([_moduleName] call cse_fnc_isModuleEnabled_F) exitwith {
	[[_moduleName, _arguments, false],"moduleEnabled_f"] call cse_fnc_customEventHandler_F;
};
if (isnil "CSE_F_MODULE_OBJ_EH") then {
	CSE_F_MODULE_OBJ_EH = [];
};
CSE_F_MODULE_OBJ_EH pushback _moduleName;

_initField = getText(ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _moduleName >> "init");
_arguments call compile _initField;

if !(isnil "cse_f_eventhandlers_collection") then {
	{
		missionNamespace setvariable [_x, nil]; // clear all eventhandlers.
	}foreach cse_f_eventhandlers_collection;
};
[_moduleName] call cse_fnc_parseModuleForConfigurations;

[[_moduleName, _arguments, true],"moduleEnabled_f"] call cse_fnc_customEventHandler_F;

[format["Initalize module: %1 COMPLETED. Arguments: %2", _moduleName, _arguments], 3] call cse_fnc_debug;