class CfgPatches {
  class cse_sys_misc {
    units[] = {""};
    weapons[] = {};
    requiredVersion = 0.1;
    requiredAddons[] = {"cse_gui","cse_main", "cse_f_modules", "cse_f_eh"};
    version = "0.10.0_rc";
    author[] = {"Combat Space Enhancement"};
    authorUrl = "http://csemod.com";
  };
};

class CfgAddons {
    class PreloadAddons {
       class cse_sys_misc {
          list[] = {"cse_sys_misc"};
       };
    };
};
#include "CfgFunctions.h"
#include "CfgVehicles.h"
#include "Combat_Space_Enhancement.h"