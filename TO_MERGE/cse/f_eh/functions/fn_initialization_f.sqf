/**
 * fn_initialization_f.sqf
 * @Descr: Grabs all pre and post init defined events from the config files and executes those.
 * @Author: Glowbal
 *
 * @Arguments: [setToExecute STRING]
 * @Return: void
 * @PublicAPI: false
 */

private ["_allPreInitHandlers","_cfg","_cfgOpt","_text"];
_allPreInitHandlers = [];

if ((_this select 0) == "preInit") then {
	_cfg = (ConfigFile >> "Combat_Space_Enhancement" >> "EventHandlers" >> "PreInit_EventHandlers");

	for "_i" from 0 to ((count _cfg)-1) /* step +1 */ do {
		 _this spawn (compile (getText ((_cfg select _i) >> "init")));
	};
} else {
	if ((_this select 0) == "postInit") then {
		_cfg = (ConfigFile >> "Combat_Space_Enhancement" >> "EventHandlers" >> "PostInit_EventHandlers");

		for "_i" from 0 to ((count _cfg)-1) /* step +1 */ do {
			 _this spawn (compile (getText ((_cfg select _i) >> "init")));
		};
	};
};

if (isnil "CSE_F_EH_ALLOW_MISSION_CONFIG") then {
	CSE_F_EH_ALLOW_MISSION_CONFIG = true;
};

if (CSE_F_EH_ALLOW_MISSION_CONFIG) then {
	_allPreInitHandlers = [];
	if ((_this select 0) == "preInit") then {
		_cfg = (missionConfigFile >> "Combat_Space_Enhancement" >> "EventHandlers" >> "PreInit_EventHandlers");

		for "_i" from 0 to ((count _cfg)-1) /* step +1 */ do {
			 _this spawn (compile (getText ((_cfg select _i) >> "init")));
		};
	} else {
		if ((_this select 0) == "postInit") then {
			_cfg = (missionConfigFile >> "Combat_Space_Enhancement" >> "EventHandlers" >> "PostInit_EventHandlers");

			for "_i" from 0 to ((count _cfg)-1) /* step +1 */ do {
				 _this spawn (compile (getText ((_cfg select _i) >> "init")));
			};
		};
	};
};

if ((_this select 0) == "postInit") then {
	cse_postInit = true;
};