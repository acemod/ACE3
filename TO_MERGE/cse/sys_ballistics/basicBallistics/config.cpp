class CfgPatches {
	class cse_sys_winddeflection {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"cse_f_eh","cse_main"};
		versionDesc = "CSE Wind Deflection";
		version = "0.10.0_rc";
		author[] = {"Combat Space Enhancement"};
		authorUrl = "http://csemod.com";
	};
};

class cse_sys_winddeflection {
    class PreloadAddons {
       class cse_sys_winddeflection {
          list[] = {"cse_sys_winddeflection"};
       };
    };
};
#include "CfgAmmo.h"
#include "CfgVehicles.h"
#include "CfgMagazines.h"
#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"
#include "GUI.h"