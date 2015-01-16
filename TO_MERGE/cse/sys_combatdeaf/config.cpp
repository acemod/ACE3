class CfgPatches {
	class cse_sys_combatdeaf {
		units[] = {"cse_crateCombatDeafness", "cse_earplugsItem", "cse_earplugs_electronicItem"};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"cse_f_eh","cse_main"};
		versionDesc = "CSE Combat Deafness";
		version = "0.10.0_rc";
		author[] = {"Combat Space Enhancement"};
		authorUrl = "http://csemod.com";
	};
};

class cse_sys_combatdeaf {
    class PreloadAddons {
       class cse_sys_combatdeaf {
          list[] = {"cse_sys_combatdeaf"};
       };
    };
};

#include "CfgVehicles.h"
#include "CfgWeapons.h"
#include "CfgSounds.h"
#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"