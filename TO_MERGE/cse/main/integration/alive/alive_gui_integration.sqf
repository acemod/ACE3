/**
 * alive_gui_integration.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include <\x\alive\addons\sys_adminactions\script_component.hpp>
#include <\x\cba\addons\ui_helper\script_dikCodes.hpp>

#define ALiVE_ICON 	"cse\cse_gui\radialmenu\data\icons\icon_alive_mod.paa"

private ["_entries", "_openAdminActions"];

waitUntil{!isnil "cse_gui"};

// ALiVE Admin Actions

_alive_openAdminActions = {
	private ["_entries"];
	_entries = [];
	if ((MOD(adminActions) getVariable ["ghost", 0]) == "1") then {
		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_GHOST_ENABLE", ALiVE_ICON, {player setCaptive true; _this call cse_alive_openAdminActions; }, (!captive player), localize "STR_ALIVE_ADMINACTIONS_GHOST_COMMENT"]];

		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_GHOST_DISABLE", ALiVE_ICON, {player setCaptive false; _this call cse_alive_openAdminActions; }, (captive player), localize "STR_ALIVE_ADMINACTIONS_GHOST_COMMENT"]];
	};
	if ((MOD(adminActions) getVariable ["teleport", 0]) == "1") then {
		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_TELEPORT_ENABLE", ALiVE_ICON, { MOD(adminActions) setVariable ["teleport_enabled", true]; onMapSingleClick {vehicle player setPos _pos;}; _this call cse_alive_openAdminActions;  }, !(MOD(adminActions) getVariable ["teleport_enabled", false]), localize "STR_ALIVE_ADMINACTIONS_TELEPORT_COMMENT"]];

		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_TELEPORT_DISABLE",ALiVE_ICON, { MOD(adminActions) setVariable ["teleport_enabled", false]; onMapSingleClick DEFAULT_MAPCLICK; _this call cse_alive_openAdminActions;  }, (MOD(adminActions) getVariable ["teleport_enabled", false]), localize "STR_ALIVE_ADMINACTIONS_TELEPORT_COMMENT"]];

		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_TELEPORTUNITS", ALiVE_ICON, { ["CAManBase"] spawn ALiVE_fnc_AdminActionsTeleportUnits; _this call cse_alive_openAdminActions;  }, true, localize "STR_ALIVE_ADMINACTIONS_TELEPORTUNITS_COMMENT"]];
	};
	if ((MOD(adminActions) getVariable ["mark_units", 0]) == "1") then {
		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_MARK_UNITS_ENABLE", ALiVE_ICON, { [] call ALIVE_fnc_markUnits; _this call cse_alive_openAdminActions;  }, true, localize "STR_ALIVE_ADMINACTIONS_MARK_UNITS_COMMENT"]];
	};
	if (["ALiVE_mil_CQB"] call ALiVE_fnc_isModuleAvailable) then {
		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_CQB_ENABLE", ALiVE_ICON, { {MOD(adminActions) setVariable ["CQB_enabled", true];  [_x,"debug",true] call ALiVE_fnc_CQB} foreach (MOD(CQB) getVariable ["instances",[]]); _this call cse_alive_openAdminActions; }, !(MOD(adminActions) getVariable ["CQB_enabled", false]), localize "STR_ALIVE_ADMINACTIONS_CQB_ENABLE_COMMENT"]];

		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_CQB_DISABLE", ALiVE_ICON,{ MOD(adminActions) setVariable ["CQB_enabled", false]; {[_x,"debug",false] call ALiVE_fnc_CQB} foreach (MOD(CQB) getVariable ["instances",[]]); _this call cse_alive_openAdminActions; }, (MOD(adminActions) getVariable ["CQB_enabled", false]), localize "STR_ALIVE_ADMINACTIONS_CQB_DISABLE_COMMENT"]];
	};
	if (["ALiVE_sys_profile"] call ALiVE_fnc_isModuleAvailable) then {
		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_PROFILES_DEBUG_ENABLE", ALiVE_ICON,{ MOD(adminActions) setVariable ["PROFILES_enabled", true]; [] call ALIVE_fnc_profileSystemDebug;_this call cse_alive_openAdminActions;  }, !(MOD(adminActions) getVariable ["PROFILES_enabled", false]), localize "STR_ALIVE_ADMINACTIONS_PROFILES_DEBUG_COMMENT"]];

		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_PROFILES_DEBUG_DISABLE", ALiVE_ICON,{ MOD(adminActions) setVariable ["PROFILES_enabled", false]; [] call ALIVE_fnc_profileSystemDebug; _this call cse_alive_openAdminActions; }, (MOD(adminActions) getVariable ["PROFILES_enabled", false]), localize "STR_ALIVE_ADMINACTIONS_PROFILES_DEBUG_COMMENT"]];
	};
	if ((MOD(adminActions) getVariable ["profiles_create", 0]) == "1") then {
		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_CREATE_PROFILES_ENABLE", ALiVE_ICON,{  [] call ALIVE_fnc_adminCreateProfiles; _this call cse_alive_openAdminActions; }, true, localize "STR_ALIVE_ADMINACTIONS_CREATE_PROFILES_COMMENT"]];
	};
	if (["ALiVE_amb_civ_population"] call ALiVE_fnc_isModuleAvailable) then {
		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_AGENTS_DEBUG_ENABLE", ALiVE_ICON,{MOD(adminActions) setVariable ["AGENTS_enabled", true]; [] call ALIVE_fnc_agentSystemDebug; _this call cse_alive_openAdminActions; }, !(MOD(adminActions) getVariable ["AGENTS_enabled", false]), localize "STR_ALIVE_ADMINACTIONS_AGENTS_DEBUG_COMMENT"]];

		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_AGENTS_DEBUG_DISABLE", ALiVE_ICON,{ MOD(adminActions) setVariable ["AGENTS_enabled", false]; [] call ALIVE_fnc_agentSystemDebug;_this call cse_alive_openAdminActions; }, (MOD(adminActions) getVariable ["AGENTS_enabled", false]), localize "STR_ALIVE_ADMINACTIONS_PROFILES_DEBUG_COMMENT"]];
	};
	if ((MOD(adminActions) getVariable ["console", 0]) == "1") then {
		_entries set [ count _entries, [localize "STR_ALIVE_ADMINACTIONS_CONSOLE_ENABLE", ALiVE_ICON,{ closeDialog 0; createDialog "RscDisplayDebugPublic"; }, true, localize "STR_ALIVE_ADMINACTIONS_CONSOLE_COMMENT"]];
	};

	[ _this select 3,
		_entries,
		_this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true
	] call cse_fnc_openRadialSecondRing_GUI;
};

_entries = [
	[localize "STR_ALIVE_ADMINACTIONS", {true /* Condition should check for activation of ALiVE Admin */}, ALiVE_ICON, _alive_openAdminActions, localize "STR_ALIVE_ADMINACTIONS"]
];
["ActionMenu","alive_actions", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

