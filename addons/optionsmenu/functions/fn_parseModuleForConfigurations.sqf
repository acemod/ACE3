/**
 * fn_parseModuleForConfigurations.sqf
 * @Descr: Collects all configurations defined in the CfgModules entry
 * @Author: Glowbal
 *
 * @Arguments: [cfgModulesName STRING (Name of the module defined in CfgModules)]
 * @Return: nil
 * @PublicAPI: false
 */

#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

private ["_config","_cfgRoot","_amountOfClasses","_i","_moduleName","_configurationClass","_nOfConfgClasses","_j","_configuration","_configurationName","_title","_desc","_defaultValue","_code","_idd","_availableSettings","_valuesCfg","_nOfValues","_k"];
_moduleName = _this select 0;
_cfgRoot = (configFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _moduleName);

if (isClass (_cfgRoot >> "Configurations")) then {
	_configurationClass = (_cfgRoot >> "Configurations");
	_nOfConfgClasses = count _configurationClass;
	for [{_j=0}, {_j < _nOfConfgClasses}, {_j=_j+1}] do {
		_configuration = _configurationClass select _j;
		_configurationName = ConfigName _configuration;

		_title = [_configuration, "title", ""] call BIS_fnc_returnConfigEntry;
		_desc = [_configuration, "description", ""] call BIS_fnc_returnConfigEntry;

		switch (getNumber(_configuration >> "type")) do {
			case MENU_KEYBINDING: {
				_defaultValue = [_configuration, "value", [0,0,0,0]] call BIS_fnc_returnConfigEntry;
				_code = compile (format["disableSerialization; if (['%1'] call cse_fnc_isModuleEnabled_F) then {", _moduleName] + ([_configuration, "onPressed", ""] call BIS_fnc_returnConfigEntry) +  "};");
				_idd = [_configuration, "idd", 0] call BIS_fnc_returnConfigEntry;
				[format["name: %1, default %2, code %3, idd %4, title %5, desc %6",_configurationName, _defaultValue, _code, _idd, _title, _desc]] call cse_fnc_debug;
				[_configurationName, ([_configurationName,"menu",_defaultValue] call cse_fnc_getKeyBindingFromProfile_F), _code, _idd] call cse_fnc_addKeyBindingForMenu_F;
				[_configurationName,"menu", _title, _desc] call cse_fnc_settingsDefineDetails_F;
			};
			case ACTION_KEYBINDING: {
				_defaultValue = [_configuration, "value", [0,0,0,0]] call BIS_fnc_returnConfigEntry;
				_code = compile (format["disableSerialization; if (['%1'] call cse_fnc_isModuleEnabled_F) then {", _moduleName] + ([_configuration, "onPressed", ""] call BIS_fnc_returnConfigEntry) +  "};");
				[format["name: %1, default %2, code %3, title %4, desc %5",_configurationName, _defaultValue, _code, _title, _desc]] call cse_fnc_debug;
				[_configurationName, ([_configurationName,"action",_defaultValue] call cse_fnc_getKeyBindingFromProfile_F), _code] call cse_fnc_addKeyBindingForAction_F;
				[_configurationName,"action", _title, _desc] call cse_fnc_settingsDefineDetails_F;

			};
			case CLIENT_SETTING: {
				_defaultValue = [_configuration, "value", 0] call BIS_fnc_returnConfigEntry;
				_code = compile (format["disableSerialization; if (['%1'] call cse_fnc_isModuleEnabled_F) then {", _moduleName] + ([_configuration, "onChanged", ""] call BIS_fnc_returnConfigEntry) +  "};");
				_availableSettings = [];
				_valuesCfg = (_configuration >> "Values");
				if (isClass _valuesCfg) then {
					_nOfValues = count _valuesCfg;
					for [{_k=0}, {_k < _amountOfClasses}, {_k=_k+1}] do {
						if (isClass (_valuesCfg select _k)) then {
							_availableSettings pushback (configName (_valuesCfg select _k));
						};
					};
				};
			};
			default {}; // invalid, do nothing
		};
	};
};