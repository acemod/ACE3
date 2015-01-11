#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = { 
			"ACE_Arty_AimingPost_M1A2_M58",
			"ACE_Arty_AimingPost_M1A2_M59",
			"ACE_Arty_M1A1_Collimator",
			"ACE_Arty_M2A2_Aiming_Circle"
		};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CAWeapons", "ace_sys_arty", "ace_sys_interaction", "ace_main"};
		author[] = {"Nou"};
		VERSION_CONFIG;
	};
};

PRELOAD_ADDONS;

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "dialogs.hpp"


