class CfgPatches {
	class cse_sys_backblast {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"cse_f_eh","cse_main"};
		versionDesc = "CSE Backblast";
		version = "0.10.0_rc";
		author[] = {"Combat Space Enhancement"};
		authorUrl = "http://csemod.com";
	};
};

class cse_sys_weaponrest {
    class PreloadAddons {
       class cse_sys_backblast {
          list[] = {"cse_sys_backblast"};
       };
    };
};

#include "CfgVehicles.h"
#include "CfgWeapons.h"
#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"