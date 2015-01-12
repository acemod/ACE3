class CfgPatches
{
 class cse_main
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"A3_Modules_F", "cse_f_eh"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_main {
          list[] = {"cse_main"};
       };
    };
};
class CfgUnitInsignia {
  class CSE {
    displayName = "Combat Space Enhancement"; // Name displayed in Arsenal
    author = "Combat Space Enhancement"; // Author displayed in Arsenal
    texture = "\cse\cse_main\data\cse_insignia.paa"; // Image path
    textureVehicle = ""; // Does nothing currently, reserved for future use
  };
};

#include "Combat_Space_Enhancement.h"
#include "CfgVehicles.h"
#include "CfgFunctions.h"
#include "CfgHints.h"