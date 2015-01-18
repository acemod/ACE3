#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = { "ACE_M47_Static" };
		weapons[] = { "ACE_M47StaticLauncher", "M47Launcher_EP1", "ACE_M47_Daysight" };
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { "ace_main", "ace_common" };
		VERSION_CONFIG;
	};
};

#include "CfgEventhandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"