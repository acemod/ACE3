#define _ARMA_
class CfgPatches
{
 class cse_sys_vehicles
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"cse_gui","cse_main"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_sys_vehicles {
          list[] = {"cse_sys_vehicles"};
       };
    };
};
#include "CfgFunctions.h"
#include "UI.h"
#include "Combat_Space_Enhancement.h"

#include "CfgWeapons.h"