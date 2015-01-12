class CfgPatches {
	class cse_sys_weaponheat {
		units[] = {"cse_sparebarrelbagItem"};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"cse_f_eh","cse_main", "A3_Weapons_F", "A3_Weapons_F_Rifles_MX"};
		version = "0.10.0_rc";
		author[] = {"Combat Space Enhancement"};
		authorUrl = "http://csemod.com";
	};
};

class cse_sys_weaponheat {
    class PreloadAddons {
       class cse_sys_weaponheat {
          list[] = {"cse_sys_weaponheat"};
       };
    };
};

#include "CfgVehicles.h"
#include "CfgWeapons.h"
#include "CfgSounds.h"
#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"