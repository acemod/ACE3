
#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CAWeapons", "ace_sys_arty", "ace_main", "ace_sys_interaction", "ace_sys_huntir", "ace_sys_disposal", "ace_sys_crewserved"};
		VERSION_CONFIG;
		author[] = {"Falcone","Nou","Rocko"};
	};
};

PRELOAD_ADDONS;

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgSfx.hpp"
#include "CfgEffects.hpp"
#include "CfgCloudlets.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "prep_dialog.hpp"
