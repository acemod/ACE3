#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[]= {
			"ACE_Slingrope_L",
			"ACE_Slingrope_M",
			"ACE_Slingrope_P",
			"ACE_Slingrope"
		};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"ace_common","ace_c_weapon", "ace_sys_interaction"
		};
		version = VERSION;
		author[] = {"Rocko"};
	};

	// Backwards
	class ace_sys_ravlifter {
		units[]= {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {QUOTE(MAIN_ADDON)};
		version = VERSION;
	};
};

PRELOAD_ADDONS;

#include "CfgVehicles.hpp"
#include "CfgEventhandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"


