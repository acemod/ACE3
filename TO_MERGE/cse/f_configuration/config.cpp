#define _ARMA_
class CfgPatches
{
 class cse_f_configuration
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"a3_ui_f", "cse_gui"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_f_configuration {
          list[] = {"cse_f_configuration"};
       };
    };
};

#include "CfgFunctions.h"
#include "CfgHints.h"
#include "Combat_Space_Enhancement.h"
#include "GUI.h"