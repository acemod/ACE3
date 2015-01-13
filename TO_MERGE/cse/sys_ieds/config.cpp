#define _ARMA_
class CfgPatches
{
 class cse_sys_ieds
 {
  units[] = {"cse_thorIII_backpack" /*, "cse_ied_pressureplate_small", "cse_ied_pressureplate_large", "cse_ied_radio_small", "cse_ied_radio_large"*/};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"cse_f_eh","cse_main"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};

#include "CfgFunctions.h"
#include "CfgVehicles.h"
#include "CfgWeapons.h"
#include "CfgSounds.h"
#include "Combat_Space_Enhancement.h"
#include "CfgAddOns.h"
#include "GUI.h"