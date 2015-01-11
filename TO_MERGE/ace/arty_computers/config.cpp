#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CAWeapons", "ace_sys_arty", "ace_main"};
		VERSION_CONFIG;
	};
};

PRELOAD_ADDONS;

#include "CfgVehicles.hpp"
