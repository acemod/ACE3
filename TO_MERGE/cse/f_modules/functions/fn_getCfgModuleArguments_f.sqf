/**
 * fn_getCfgModuleArguments_f.sqf
 * @Descr: Grab Module arguments for a specific module in a config file.
 * @Author: Glowbal
 *
 * @Arguments: [moduleName STRING (The classname of the CSE module), configPath CONFIG (Path to the module Config)]
 * @Return: ARRAY An array with parameters for given module. If the parameters for the provided module have not been found within the config, default values will be used.
 * @PublicAPI: true
 */

private ["_configOfModule","_collectedInits","_cfgRoot","_amountOfClasses","_i","_arguments","_moduleName","_CfgVehEntry","_CfgModuleEntry","_moduleArguments","_j","_cfg","_value","_typeNameArgument", "_return"];
_moduleName = _this select 0;
_configOfModule = _this select 1;
_return = [];
// Array for collection all initalization arguments for the given module.
_arguments = [];
// Grab necessary config entries

_CfgVehEntry = (ConfigFile >> "CfgVehicles" >> _moduleName);
_CfgModuleEntry = (ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _moduleName);

if (isClass _CfgModuleEntry) then {
	if (isClass _CfgVehEntry) then {
		// init with parameters
		_moduleArguments = (_CfgVehEntry >> "Arguments");
		if (isClass _moduleArguments) then {

			// Looping through the expected arguments, based on what is defined in the module Argument Class in CfgVehicles.
			for [{_j=0}, {_j < (count _moduleArguments)}, {_j=_j+1}] do {
				// if the argument is a class, parse it. Otherwise we will be ignoring it.
				if (isClass (_moduleArguments select _j)) then {

					// Grab the value from the argument defined in the description.ext and current class.
					_value = 0; // (_configOfModule >> configName(_moduleArguments select _j)) call bis_fnc_getCfgData;
					// This will be used to validate the retrieved value for a proper value.
					_typeNameArgument = getText((_moduleArguments select _j) >> "typeName");

					call {
						if (_typeNameArgument == "BOOL") exitwith {
							_value = getNumber(_configOfModule >> configName(_moduleArguments select _j)) == 1;
						};
						if (_typeNameArgument == "NUMBER") exitwith {
							_value = getNumber(_configOfModule >> configName(_moduleArguments select _j));
						};
						if (_typeNameArgument == "STRING") exitwith {
							_value = getText(_configOfModule >> configName(_moduleArguments select _j));
						};
					};

					// If the argument is defined in the description.ext, we will validate the typeName of the argument and store it in the argument array.
					if (!isnil "_value") then {
						if (typeName _value == _typeNameArgument || TRUE) then { // lets assume the values are correct until we write a function to properly compare the typeNames.
							_arguments pushback [(ConfigName (_moduleArguments select _j)), _value];
						} else {
							// Incase the typeName is invalid, we will set a default value and store this instead.
							call {
								if (_typeNameArgument == "BOOL") exitwith {
									_value = getNumber((_moduleArguments select _j) >> "defaultValue") == 1;
								};
								if (_typeNameArgument == "NUMBER") exitwith {
									_value = getNumber((_moduleArguments select _j) >> "defaultValue");
								};
								if (_typeNameArgument == "STRING") exitwith {
									_value = getText((_moduleArguments select _j) >> "defaultValue");
								};
							};
							[format["Module Argument has not been set %1 %2. Module need to be replaced. Value used: %4", _moduleName, (ConfigName (_moduleArguments select _j)), _typeNameArgument, _value], 1] call cse_fnc_debug;
							_arguments pushback [(ConfigName (_moduleArguments select _j)), _value];
						};
					} else {
						[format["Value is nil for %1 %2", _moduleName, (ConfigName (_moduleArguments select _j))], 1] call cse_fnc_debug;
						// Because the value has not been defined, we will use a default value instead.
						// TODO implement defaultValue retrieval for non defined arguments.
						_value = "";
						if (_typeNameArgument != "") then {
							call {
								if (_typeNameArgument == "BOOL") exitwith {
									_value = getNumber((_moduleArguments select _j) >> "defaultValue") == 1;
								};
								if (_typeNameArgument == "NUMBER") exitwith {
									_value = getNumber((_moduleArguments select _j) >> "defaultValue");
								};
								if (_typeNameArgument == "STRING") exitwith {
									_value = getText((_moduleArguments select _j) >> "defaultValue");
								};
							};
							[format["Module Argument has not been set %1 %2. Module need to be replaced. Value used: %4", _moduleName, (ConfigName (_moduleArguments select _j)), _typeNameArgument, _value], 1] call cse_fnc_debug;
							_arguments pushback [(ConfigName (_moduleArguments select _j)), _value];
						};
					};
				};
			};
		};
	} else {
		// init with no parameters. We do not have to collect anything for this.
	};
};
_arguments