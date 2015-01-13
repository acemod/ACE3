#define _ARMA_
class CfgPatches
{
 class cse_gui
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"a3_ui_f", "cse_main"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_gui {
          list[] = {"cse_gui"};
       };
    };
};

#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"
#include "GUI.h"