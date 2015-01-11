#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {
			"ace_arty_rangeTable_m119",
			"ace_arty_rangeTable_m224_legacy",
			"ace_arty_rangeTable_m252_legacy",
			"ace_arty_rangeTable_2b14_legacy",
			"ace_arty_rangeTable_m119_legacy",
			"ace_arty_rangeTable_d30_legacy"
		};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CAWeapons", "ace_main", "ace_sys_arty", "ace_sys_interaction" };
		VERSION_CONFIG;
	};
};

PRELOAD_ADDONS;

class CfgVehicles {
	#include "CfgAmmoBoxes.hpp"
};

#include "CfgWeapons.hpp"
#include "CfgEventHandlers.hpp"
#include "dialog.hpp"
