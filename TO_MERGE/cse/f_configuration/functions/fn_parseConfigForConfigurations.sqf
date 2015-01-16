/**
 * fn_parseConfigForConfigurations.sqf
 * @Descr: Collect all configurations defined in CfgModules
 * @Author: Glowbal
 *
 * @Arguments: [config CONFIG]
 * @Return: nil
 * @PublicAPI: false
 */

#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

private ["_config","_cfgRoot","_amountOfClasses","_i","_moduleName","_configurationClass","_nOfConfgClasses","_j","_configuration","_configurationName","_title","_desc","_defaultValue","_code","_idd","_availableSettings","_valuesCfg","_nOfValues","_k"];
_config = _this select 0;

_cfgRoot = (_config >> "Combat_Space_Enhancement" >> "CfgModules");
_amountOfClasses = count _cfgRoot;
for [{_i=0}, {_i < _amountOfClasses}, {_i=_i+1}] do {
	[ConfigName (_cfgRoot select _i)] call cse_fnc_parseModuleForConfigurations;
};