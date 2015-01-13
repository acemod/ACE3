#define _ARMA_
class CfgPatches {
 class cse_sys_field_rations {
  units[] = {"cse_field_rations_all"};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"cse_gui", "cse_main", "cse_f_eh", "cse_f_configuration", "cse_f_modules", "cse_f_states"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};

class CfgAddons {
    class PreloadAddons {
       class cse_sys_field_rations {
          list[] = {"cse_sys_field_rations"};
       };
    };
};

#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"
#include "CfgVehicles.h"

// Here for backwards compatabilty. 
// #include "CfgMagazines.h"

#include "CfgWeapons.h"
#include "CfgSounds.h"
#include "GUI.h"