CSE_AI_COLLECTION_LOOP = [[]];
if (isnil "CSE_OBJECTS_TRACING") then {
	CSE_OBJECTS_TRACING = [];
};

["cse_interactionRegister",[],true,"cse_framework"] call cse_fnc_defineVariable;
["cse_interactionTarget",objNull,true,"cse_framework"] call cse_fnc_defineVariable;
["cse_variableMonitor",[],false,"cse_framework"] call cse_fnc_defineVariable;
["CSE_ENABLE_REVIVE_COUNTER",0,false,"cse_framework"] call cse_fnc_defineVariable;
["cse_inReviveState", false, true, "cse_framework"] call cse_fnc_defineVariable;

cse_main = true;

if (isnil "CSE_F_MODULE_OBJ_EH") then {
	CSE_F_MODULE_OBJ_EH = [];
};
CSE_F_MODULE_OBJ_EH pushback "cse_main";
if (isnil "CSE_TASK_POOL_COLLECTION_F") then {
	CSE_TASK_POOL_COLLECTION_F = [];
};
if (isNil "CSE_ENABLE_REVIVE_F") then {
	CSE_ENABLE_REVIVE_F = 0;
};
if (hasInterface) then{
	[] spawn {

		sleep 1;
		waitUntil {!isNull player && !(isNull (findDisplay 46))};
		player setvariable ["cse_name", name player, true];
		player addEventHandler ["respawn", {_this call cse_fnc_resetAllDefaults_F;}];
		11401 cutRsc ["cse_gui_iconsDisplay","PLAIN"];

		if (["cse_sys_vehicles"] call cse_fnc_isModLoaded_F) then {
			call compile preprocessFile "cse\cse_sys_vehicles\init.sqf";
		};
	};
};

["Task Loop is starting"] call cse_fnc_debug;
["cse_main_taskPool_f", "oneachframe", cse_fnc_loopThroughPool_f] call BIS_fnc_addStackedEventHandler;

if (["cse_sys_ieds"] call cse_fnc_isModLoaded_F) then {
	["cse_sys_ieds", []] call cse_fnc_enableModule_f;
};

if ([] call cse_fnc_isLoaded_ALiVE_Mod) then {
	// integrate ALiVE menu with CSE Radial Action menu
	// call compile preprocessFile	"cse\cse_main\integration\alive\alive_gui_integration.sqf";
	// call compile preprocessFile	"cse\cse_main\integration\alive\alive_flexiMenu_integration.sqf";
};

// version checks
if !(isServer) exitwith {};
if (isnil "cse_fnc_getVersion") exitwith {};

_versionCheckCode = compile format['
	if (isServer) exitwith {};
	sleep 5;
	_serverVersion = "%1";
	CSE_SERVER_VERSION = _serverVersion;
	if (!isnil "cse_fnc_getVersion") then {
		_clientVersion = [] call cse_fnc_getVersion;
		if (_serverVersion != _clientVersion) then {
			// incorrect version
			_warningMessage = format["WARNING: CSE Version mismatch. Server version: %1 Client version: %2", _serverVersion, _clientVersion];
			diag_log _warningMessage;
			systemChat _warningMessage;

			[[{sysemChat format["%1" has an incorrect version of CSE", _this];}, player], "BIS_fnc_spawn", true, true] call BIS_fnc_MP;
		} else {
			["Passed version check - same as server"] call cse_fnc_debug;
		};
	} else {
		// incorrect version
		_warningMessage = format["WARNING: CSE Version mismatch: Server version: %1 Client version: unknown"];
		diag_log _warningMessage;
		systemChat _warningMessage;
	};
', call cse_fnc_getVersion];

[_versionCheckCode, "BIS_fnc_spawn", true, true] call BIS_fnc_MP;
