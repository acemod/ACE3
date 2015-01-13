/**
 * fn_getCfgModuleInits_f.sqf
 * @Descr: Grab all defined modules in the given config space, collect their arguments and return them.
 * @Author: Glowbal
 *
 * @Arguments: [config CONFIG (For example: MissionConfigFile or ConfigFile)]
 * @Return: ARRAY Array with format: [[moduleName STRING, moduleArgs ARRAY (Format: [argumentName STRING, value ANY])], ...]
 * @PublicAPI: false
 */

private ["_config","_collectedInits","_cfgRoot","_amountOfClasses","_i","_arguments","_moduleName","_CfgVehEntry","_CfgModuleEntry","_moduleArguments","_j","_cfg","_value","_moduleArgs"];
_config = [_this, 0, MissionConfigFile, [MissionConfigFile]] call BIS_fnc_Param;

_collectedInits = [];
_cfgRoot = (_config >> "Combat_Space_Enhancement" >> "Modules");
_amountOfClasses = count _cfgRoot;
for [{_i=0}, {_i < _amountOfClasses}, {_i=_i+1}] do {
	if (isClass (_cfgRoot select _i)) then {
		_moduleName = ConfigName (_cfgRoot select _i);
		_disableConfigExecution = getNumber (ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _moduleName >> "disableConfigExecution");
		if (_disableConfigExecution > 0) exitwith {};
		if (!([_moduleName] call cse_fnc_isModuleEnabled_f)) then {
			_moduleArgs = [_moduleName, (_cfgRoot select _i)] call cse_fnc_getCfgModuleArguments_f;
			_collectedInits pushback [_moduleName, _moduleArgs];
		};
	};
};
_collectedInits