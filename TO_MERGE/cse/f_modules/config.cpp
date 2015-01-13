class CfgPatches
{
	 class cse_f_modules
	 {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"cse_main"};
		version = "0.10.0_rc";
		author[] = {"Combat Space Enhancement"};
		authorUrl = "http://csemod.com";
	 };
};
class CfgAddons {
	class PreloadAddons {
		class cse_f_modules {
			list[] = {"cse_f_modules"};
		};
	};
};

#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"