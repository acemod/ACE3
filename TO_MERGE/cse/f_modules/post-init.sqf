// Collect cfg modules and initalize them.
[] spawn {
	// by waiting, we ensure that CSE Config modules aren't initalized before the modules have been.
	sleep 5;
	_toinitalizeModules = [MissionConfigFile] call cse_fnc_getCfgModuleInits_f;
	{
		[format["initalize module through cfg: %1",_x]] call cse_fnc_debug;
		_x call cse_fnc_enableModule_f;
	}foreach _toinitalizeModules;

	// Check if we want to collect server side modules
	_allowCfg = ((getNumber(MissionConfigFile >> "Combat_Space_Enhancement" >> "DisableModuleConfig")) == 0);
	if (isServer && _allowCfg) then {
		_toinitalizeModules = [configFile] call cse_fnc_getCfgModuleInits_f;

		[format["initalize modules through server cfg: %1",_toinitalizeModules]] call cse_fnc_debug;
		if !(_toinitalizeModules isEqualTo []) then {
			[[_toinitalizeModules], "cse_fnc_remoteModuleInit", true, true] spawn BIS_fnc_MP;
		};
	};
};