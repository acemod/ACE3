// #define DEBUG_MODE_FULL
#include "script_component.hpp"
SCRIPT(init_pre);

if !(isNil'SLX_XEH_MACHINE') exitWith {}; // Doublecheck..

LOG(MSG_INIT);
// No _this in pre/PostInit, also fixes call to init_compile
private "_this";
_this = nil;

private ["_id", "_cfgRespawn", "_respawn", "_level"];

// UNIQUE Session ID since start of game
_id = uiNamespace getVariable "SLX_XEH_ID";
if (isNil "_id") then { _id = 1 } else { if (typeName _id != "SCALAR") then { _id = 0 }; if (_id < 0) then { _id = 0 }; INC(_id) };
uiNamespace setVariable ["SLX_XEH_ID", _id];

CBA_isCached = uiNamespace getVariable "CBA_isCached";
CBA_isCached = if (isNil "CBA_isCached" && {isMultiplayer} && {!isDedicated}) then { -1 } else { _id };
uiNamespace setVariable ["CBA_isCached", CBA_isCached];

if (isNil "SLX_XEH_RECOMPILE") then { SLX_XEH_RECOMPILE = CACHE_DIS(xeh) };

if (!isMultiplayer || {isDedicated} || {CBA_isCached == -1}) then {
	uiNamespace setVariable ["SLX_XEH_CACHE_KEYS", []];
	uiNamespace setVariable ["SLX_XEH_CACHE_KEYS2", []];
	uiNamespace setVariable ["SLX_XEH_CACHE_KEYS3", []];
	uiNamespace setVariable ["CBA_CACHE_KEYS", []];
};

SLX_XEH_CACHE_KEYS = uiNamespace getVariable "SLX_XEH_CACHE_KEYS";
SLX_XEH_CACHE_KEYS2 = uiNamespace getVariable "SLX_XEH_CACHE_KEYS2";
SLX_XEH_CACHE_KEYS3 = uiNamespace getVariable "SLX_XEH_CACHE_KEYS3";
CBA_CACHE_KEYS = uiNamespace getVariable "CBA_CACHE_KEYS";

// Always compile cache function once
call compile preProcessFileLineNumbers 'x\cba\addons\xeh\init_compile.sqf';

// Log
SLX_XEH_DisableLogging = isClass(configFile/"CfgPatches"/"Disable_XEH_Logging");

// Backup functions for macros
// TODO: Cleanup...
// CBA_fnc_log = { diag_log [diag_frameNo, diag_tickTime, time, _this] };


/* CBA_fnc_defaultParam = {
	PARAMS_3(_params,_index,_defaultValue);
	
	private "_value";
	
	if (!isNil "_defaultValue") then {
		_value = _defaultValue;
	};
	
	if (!isNil "_params" && {(typeName _params) == "ARRAY"} && {count _params > _index} && {!isNil { _params select _index }}) then {
		_value = _params select _index;
	};
	
	// Return.
	if (isNil "_value") then {
		nil;
	} else {
		_value;
	};
};
*/

XEH_LOG("XEH: PreInit Started. v"+getText(configFile >> "CfgPatches" >> "CBA_XEH" >> "version")+". "+PFORMAT_5("MISSINIT",missionName,worldName,isMultiplayer,isServer,isDedicated));
if (time > 0) then { XEH_LOG("XEH WARNING: Time > 0; This probably means there are no XEH compatible units by default on the map, perhaps add the SLX_XEH_Logic module.") };

// Compile all necessary scripts and start one vehicle crew initialisation thread
_cfgRespawn = (missionConfigFile/"respawn");
_respawn = false;
if ( isNumber(_cfgRespawn) ) then {
	_respawn = !(getNumber(_cfgRespawn) in [0, 1, 4, 5]);
};
if ( isText(_cfgRespawn) ) then {
	_respawn = !(getText(_cfgRespawn) in ["none", "bird", "group", "side"]);
};

SLX_XEH_objects = []; // Temporary array, to track InitPosts at mission initialization
SLX_XEH_INIT_MEN = []; // Temporary array, to track ManBased inits - to workaround JIP issue "Double init eh ran for crew units"
SLX_XEH_DELAYED = [];  // Temporary array, to track Delayed Inits at mission initialization


// Game version detection
_level = 0; // pre v1.60
// TODO: Improve v1.60 detection
// TODO: Temporary disabled due to #28652
//if ((isNumber (configFile >> "CfgDifficulties" >> "recruit" >> "recoilCoef")) && (isNumber (configFile >> "CfgVehicles" >> "Car" >> "turnCoef"))) then {
	//_level = 1; // v1.60
//};

FUNC(determineProductVersion) = {
	private "_pv";
	_pv = call {productVersion};

	// A2 (and OA pre 1.61beta, and TOH pre 1.05?) does not support productVersion so we deal with it manually
	if (isNil "_pv") then { 
		_pv = if (isClass(configFile >> "CfgPatches" >> "A3_Map_Stratis")) then {
				// A3 Backup
				["Arma 3 Alpha","Arma3Alpha", -1, -1]; //,5,102571]

		} else {
			if (isClass(configFile >> "CfgPatches" >> "United_States_H")) then {
				// TOH Backup
				["TakeOn H", "TakeOnH", -1, -1];
			} else {
				if (isClass(configFile >> "CfgPatches" >> "Takistan")) then {
					// OA Backup
					["ArmA 2OA", "ArmA2OA", -1, -1];
				} else {
					// A2 Backup
					["ArmA 2", "ArmA2", -1, -1];
				};
			};
		};
	};

	_pv;
};

FUNC(determineGame) = {
	// 0 = A2
	// 1 = OA
	// 2 = TOH
	// 3 = A3 :P
	private "_pv";
	_pv = call FUNC(determineProductVersion);

	switch (_pv select 1) do {
		case "ArmA2": {0};
		case "ArmA2OA": {1};
		case "TakeOnH": {2};
		case "Arma3Alpha": {3};
		case "Arma3": {3};
		default {0};
	};
};

// System array with machine / mission / session information
SLX_XEH_MACHINE =
[
	!isDedicated, // 0 - isClient (and thus has player)
	false, // 1 - isJip
	!isServer, // 2 - isDedicatedClient (and thus not a Client-Server)
	isServer, // 3 - isServer
	isDedicated, // 4 - isDedicatedServer (and thus not a Client-Server)
	false, // 5 - Player Check Finished
	!isMultiplayer, // 6 - SP?
	false, // 7 - StartInit Passed
	false, // 8 - Postinit Passed
	isMultiplayer && {_respawn}, // 9 - Multiplayer && respawn?
	if (isDedicated) then { 0 } else { if (isServer) then { 1 } else { 2 } }, // 10 - Machine type (only 3 possible configurations)
	_id, // 11 - SESSION_ID
	_level, // 12 - LEVEL - Used for version determination
	false, // 13 - TIMEOUT - PostInit timedOut
	call FUNC(determineGame), // 14 - Game
	call FUNC(determineProductVersion) // 15 - Product+Version
];

SLX_XEH_DUMMY = switch (SLX_XEH_MACHINE select 14) do {
	case 2: {"Helipad_Invisible_H" };
	case 3: {"Land_HelipadEmpty_F" };
	default { "HeliHEmpty" };
};

SLX_XEH_STR = ""; // Empty string
SLX_XEH_STR_INIT_EH = "Extended_Init_EventHandlers";
SLX_XEH_STR_INIT_POST_EH = "Extended_InitPost_EventHandlers";
SLX_XEH_STR_PreInit = "Extended_PreInit_EventHandlers";
SLX_XEH_STR_PostInit = "Extended_PostInit_EventHandlers";
SLX_XEH_STR_DEH = "DefaultEventhandlers";
SLX_XEH_STR_TAG = "SLX_XEH_";
SLX_XEH_STR_PLAYABLE = "SLX_XEH_PLAYABLE";

SLX_XEH_STR_PROCESSED = "SLX_XEH_PROCESSED";
SLX_XEH_AR_FALSE = [SLX_XEH_STR_PROCESSED, false];
SLX_XEH_AR_TRUE = [SLX_XEH_STR_PROCESSED, true];

SLX_XEH_OTHER_EVENTS = [XEH_EVENTS,XEH_CUSTOM_EVENTS]; // All events except the init event
SLX_XEH_OTHER_EVENTS_FULL = [];
{ SLX_XEH_OTHER_EVENTS_FULL pushBack format["Extended_%1_EventHandlers", _x] } forEach SLX_XEH_OTHER_EVENTS;
SLX_XEH_OTHER_EVENTS_XEH = [];
{ SLX_XEH_OTHER_EVENTS_XEH pushBack format["Extended_%1EH", _x] } forEach SLX_XEH_OTHER_EVENTS;
SLX_XEH_OTHER_EVENTS_XEH_PLAYERS = [];
{ SLX_XEH_OTHER_EVENTS_XEH_PLAYERS pushBack  format["Extended_%1EH_Player", _x] } forEach SLX_XEH_OTHER_EVENTS;
SLX_XEH_OTHER_EVENTS_PLAYERS = [];

// HitPart is special in that the passed parameter to the event handler is an array of arrays
{
  if (_x == "HitPart") then
  {
    SLX_XEH_OTHER_EVENTS_PLAYERS pushBack (compile format["{ { _this call _x } forEach (((_this select 0) select 0) getVariable [SLX_XEH_STR_%1_Player,[]])  }",_x])
  }
  else
  {
    SLX_XEH_OTHER_EVENTS_PLAYERS pushBack (compile format["{ { _this call _x } forEach ((_this select 0) getVariable [SLX_XEH_STR_%1_Player,[]])  }",_x])
  }
} forEach SLX_XEH_OTHER_EVENTS;

SLX_XEH_CONFIG_FILES = [configFile, campaignConfigFile, missionConfigFile];
SLX_XEH_CONFIG_FILES_VARIABLE = [campaignConfigFile, missionConfigFile];

SLX_XEH_DEF_CLASSES = [SLX_XEH_STR, "All"];

// XEH for non XEH supported addons
// Only works until someone uses removeAllEventhandlers on the object
// Only works if there is at least 1 XEH-enabled object on the Map - Place SLX_XEH_Logic to make sure XEH initializes.
// TODO: Perhaps do a config verification - if no custom eventhandlers detected in _all_ CfgVehicles classes, don't run this XEH handler - might be too much processing.
SLX_XEH_EVENTS_NAT = [XEH_EVENTS];
SLX_XEH_EVENTS_FULL_NAT = [];
{ SLX_XEH_EVENTS_FULL_NAT pushBack format["Extended_%1_EventHandlers", _x] } forEach SLX_XEH_EVENTS_NAT;

SLX_XEH_EXCLUDES = []; // TODO: Anything else?? - Ammo crates for instance have no XEH by default due to crashes) - however, they don't appear in 'vehicles' list anyway.
SLX_XEH_CLASSES = []; // Used to cache classes that have full XEH setup - TODO: Performance test.. Could use object with a variable space, classname as key
SLX_XEH_FULL_CLASSES = []; // Used to cache classes that NEED full XEH setup
SLX_XEH_EXCL_CLASSES = []; // Used for exclusion classes


// Function Compilation
SLX_XEH_LOG = { XEH_LOG(_this); };

PREP(init_once); // Pre and PostInits

PREP(init_delayed);
PREP(init_playable);

// Inits and InitPosts
PREP(init);
PREP(init_enum);
PREP(init_enum_cache);
PREP(init_post);

// Init Others
PREP(init_others);
PREP(init_others_enum);
PREP(init_others_enum_cache);

PREP(addPlayerEvents); // Add / Remove the playerEvents
PREP(removePlayerEvents);
PREP(support_monitor);
PREP(support_monitor2);

call COMPILE_FILE(init_eh); // All XEH Event functions


/*
* Process the crews of vehicles. This "thread" will run just
* before PostInit and the mission init.sqf is processed. The order of execution is
*
*  1) all config.cpp init EHs (including all Extended_Init_Eventhandlers)
*  2) all the init lines in the mission.sqm
*  3) spawn:ed "threads" are started
*  4) the mission's init.sqf/sqs is run
*/

GVAR(init_obj) = SLX_XEH_DUMMY createVehicleLocal [0, 0, 0];
GVAR(init_obj) addEventHandler ["killed", {
	#ifdef DEBUG_MODE_FULL
		XEH_LOG("XEH: VehicleCrewInit: "+str(count vehicles));
	#endif

	{
		_sim = getText(configFile/"CfgVehicles"/(typeOf _x)/"simulation");
		_crew = crew _x;
		/*
		* If it's a vehicle then start event handlers for the crew.
		* (Vehicles have crew and are neither humanoids nor game logics)
		*/
		if (count _crew > 0 && {{ _sim == _x }count["soldier", "invisible"] == 0}) then {
			{ if !(_x in SLX_XEH_INIT_MEN) then { [_x] call SLX_XEH_EH_Init } } forEach _crew;
		};
	} forEach vehicles;
	SLX_XEH_INIT_MEN = nil;
	
	deleteVehicle GVAR(init_obj);GVAR(init_obj) = nil
}];

GVAR(init_obj) setDamage 1; // Schedule to run itsy bitsy later

// Prepare postInit
GVAR(init_obj2) = SLX_XEH_DUMMY createVehicleLocal [0, 0, 0];
GVAR(init_obj2) addEventHandler ["killed", {
	call COMPILE_FILE(init_post);
	deleteVehicle GVAR(init_obj2);GVAR(init_obj2) = nil;
}];

// Schedule PostInit
SLX_XEH_STR spawn {
	// Warn if PostInit takes longer than 10 tickTime seconds
	SLX_XEH_STR spawn {
		private["_time2Wait"];
		_time2Wait = diag_ticktime + 10;
		waituntil {diag_ticktime > _time2Wait};
		if !(SLX_XEH_MACHINE select 8) then { 
			XEH_LOG("WARNING: PostInit did not finish in a timely fashion");
			waitUntil {time > 0};
			// Consider there will be no player if neither PostInit-Ready, nor PlayerCheck-Ready
			if !(SLX_XEH_MACHINE select 8 || {SLX_XEH_MACHINE select 5}) then { SLX_XEH_MACHINE set [13, true]; };
		};
	};

	// On Server + Non JIP Client, we are now after all objects have inited
	// and at the briefing, still time == 0
	if (isNull player) then {
		#ifdef DEBUG_MODE_FULL
		"NULL PLAYER" call SLX_XEH_LOG;
		#endif
		if !((SLX_XEH_MACHINE select 4) || {(SLX_XEH_MACHINE select 6)}) then { // only if MultiPlayer and not dedicated
			#ifdef DEBUG_MODE_FULL
			"JIP" call SLX_XEH_LOG;
			#endif
	
			SLX_XEH_MACHINE set [1, true]; // set JIP
			// TEST for weird jip-is-server-issue :S
			if (!(SLX_XEH_MACHINE select 2) || {SLX_XEH_MACHINE select 3} || {SLX_XEH_MACHINE select 4}) then {
				str(["WARNING: JIP Client, yet wrong detection", SLX_XEH_MACHINE]) call SLX_XEH_LOG;
				SLX_XEH_MACHINE set [2, true]; // set Dedicated client
				SLX_XEH_MACHINE set [3, false]; // set server
				SLX_XEH_MACHINE set [4, false]; // set dedicatedserver
			};
			waitUntil { !(isNull player) || {SLX_XEH_MACHINE select 13} };
			if (SLX_XEH_MACHINE select 13) then { XEH_LOG("WARNING: TimedOut waiting for player object to be ready. Continueing PostInit without Player ready") };
		};
	};
	
	if !(isNull player) then {
		if (isNull (group player) && {player isKindOf "CAManBase"}) then {
			// DEBUG TEST: Crashing due to JIP, or when going from briefing
			//			 into game
			#ifdef DEBUG_MODE_FULL
			"NULLGROUP" call SLX_XEH_LOG;
			#endif
			waitUntil { !(isNull (group player)) };
		};
		waitUntil { local player };
	};

	GVAR(init_obj2) setDamage 1; // Schedule to run itsy bitsy later

	SLX_XEH_MACHINE set [5, true]; // set player check = complete
};

// Load and call any "pre-init", run-once event handlers
/*
	Compile code strings in the Extended_PreInit_EventHandlers class and call
	them. This is done once per mission and before any extended init event
	handler code is run. An addon maker can put run-once initialisation code
	in such a pre-init "EH" rather than in a normal XEH init EH which might be
	called several times.
*/
{ (_x/SLX_XEH_STR_PreInit) call FUNC(init_once) } forEach SLX_XEH_CONFIG_FILES;


XEH_LOG("XEH: PreInit Finished. " + PFORMAT_3("CACHE DISABLED? (Disable caching with cba_cache_disable.pbo)",SLX_XEH_RECOMPILE,CBA_COMPILE_RECOMPILE,CBA_FUNC_RECOMPILE));
