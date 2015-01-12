#define _ARMA_
class CfgPatches
{
 class cse_sys_logistics
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"cse_gui","cse_main","cse_f_modules"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_sys_logistics {
          list[] = {"cse_sys_logistics"};
       };
    };
};

#include "CfgVehicles.h"
#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"
#include "GUI.h"