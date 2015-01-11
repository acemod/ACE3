#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "CAWeapons", "ace_sys_arty", "ace_main", "ace_sys_crewserved", "ace_sys_interaction" };
		VERSION_CONFIG;
		author[] = {"Falcone","Rocko"};
	};
};

PRELOAD_ADDONS;

#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"

class CfgAceArtyBatteryType {
	class M224 {
		name = "M224 60mm Mortar";
		type = "cannon";
		caliber = 60;
		ammunition[] = {"ace_arty_60mm_m720a1", "ace_arty_60mm_m721", "ace_arty_60mm_m722a1"};
		weaponClass = "ace_arty_m224";
	};
	class M252 {
		name = "M252 81mm Mortar";
		type = "cannon";
		caliber = 81;
		ammunition[] = {"ace_arty_81mm_m821a2", "ace_arty_81mm_m853a1", "ace_arty_81mm_m375a3"};
		weaponClass = "ace_arty_m252";
	};
	class Tampella {
		name = "Tampella 120mm Mortar";
		type = "cannon";
		caliber = 120;
		ammunition[] = {"ace_arty_120mm_dm11a5","ace_arty_120mm_dm61","ace_arty_120mm_dm26","ace_arty_120mm_dm35"};
		weaponClass = "ace_arty_120tampella";
	};
	class 2B14 {
		name = "2B14 82mm Mortar";
		type = "cannon";
		caliber = 82;
		ammunition[] = {"ace_arty_82mm_he","ace_arty_82mm_illum","ace_arty_82mm_wp"};
		weaponClass = "ace_arty_2b14";
	};
};

#include "dialogs.hpp"
