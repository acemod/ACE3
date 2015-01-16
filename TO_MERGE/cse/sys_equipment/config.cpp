class CfgPatches {
  class cse_sys_equipment {
    units[] = {"cse_moduleGroundFlare_White", "cse_moduleGroundFlare_Red","cse_moduleGroundFlare_Green","cse_moduleGroundFlare_Yellow"};
    weapons[] = {};
    requiredVersion = 0.1;
    requiredAddons[] = {"A3_Modules_F", "A3_UI_F", "cse_main", "cse_gui", "cse_f_eh"};
    version = "0.10.0_rc";
    author[] = {"Combat Space Enhancement"};
    website = "csemod.com";
  };
  class cse_sys_magazineRepack {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.0;
    requiredAddons[] = {"cse_f_eh","cse_main"};
    versionDesc = "CSE Magazine Repack";
    version = "0.10.0_rc";
    author[] = {"Combat Space Enhancement"};
    authorUrl = "http://csemod.com";
  };
  class cse_sys_weaponrest {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.0;
    requiredAddons[] = {"cse_f_eh","cse_main", "A3_Weapons_F", "A3_Weapons_F_Rifles_MX"};
    versionDesc = "CSE Weapon Resting";
    version = "0.10.0_rc";
    author[] = {"Combat Space Enhancement", "Tupolov", "Glowbal"};
    authorUrl = "http://csemod.com";
  };
  class cse_sys_nightvision {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.0;
    requiredAddons[] = {"cse_f_eh","cse_main"};
    versionDesc = "CSE Night Vision";
    version = "0.10.0_rc";
    author[] = {"Combat Space Enhancement"};
    authorUrl = "http://csemod.com";
  };  
};

class CfgAddons {
    class PreloadAddons {
       class cse_sys_equipment {
          list[] = {"cse_sys_equipment", "cse_sys_magazineRepack", "cse_sys_weaponrest", "cse_sys_nightvision"};
       };
    };
};
#include "Combat_Space_Enhancement.h"
#include "CfgFactionClasses.h"
#include "CfgVehicles.h"
#include "CfgFunctions.h"
#include "CfgSounds.h"
#include "CfgAmmo.h"
#include "CfgWeapons.h"
#include "CfgMovesBasic.h"
#include "CfgMovesMaleSdr.h"
#include "UI.h"