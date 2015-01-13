#define _ARMA_
class CfgPatches
{
 class cse_sys_cc
 {
  units[] = {"cse_m_tabletItem", "cse_m_pdaItem", "cse_m_tablet_uk_Item", "cse_m_tablet_o_Item", "cse_m_pda_o_Item"};
  weapons[] = {"cse_m_tablet","cse_m_pda","cse_m_tablet_uk","cse_m_tablet_o", "cse_m_pda_o"};
  requiredVersion = 0.1;
  requiredAddons[] = {"cse_gui","cse_main", "A3_Weapons_F", "A3_Weapons_F_Items"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_sys_cc {
          list[] = {"cse_sys_cc"};
       };
    };
};

#include "CfgFactionClasses.h"
#include "CfgVehicles.h"
#include "CfgWeapons.h"
#include "CfgFunctions.h"
#include "ui.h"
#include "Combat_Space_Enhancement.h"