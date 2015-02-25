#include "script_component.hpp"

#include "\z\ace\addons\main\script_config.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "ace_common", "ace_c_vehicle", "ace_c_weapon", "ace_sys_interaction" };
		version = VERSION;
		author[] = {"Rocko"};
	};
};

PRELOAD_ADDONS;

#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"
#include "Dialog.hpp"
#include "CfgFunctions.hpp"
