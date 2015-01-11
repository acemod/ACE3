#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		units[] = { "ace_arty_m119" };
		weapons[] = { "ace_arty_m119" };
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CAWeapons", "ace_sys_arty", "ace_main", "ace_sys_interaction" };
		VERSION_CONFIG;
	};
};

PRELOAD_ADDONS;

#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"

class CfgAceArtyBatteryType {
	class M119 {
		name = "M119A1 105mm Howitzer";
		type = "cannon";
		caliber = 105;
		ammunition[] = {"ace_arty_105mm_m1", "ace_arty_105mm_m916", "ace_arty_105mm_m84a1", "ace_arty_105mm_m314a3"};
		weaponClass = "ace_arty_m119";
	};
};

#include "dialogs.hpp"
