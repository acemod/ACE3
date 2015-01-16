#define _ARMA_
class CfgPatches
{
 class cse_f_states
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {"cse_main"};
  version = "0.5";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_f_states {
          list[] = {"cse_f_states"};
       };
    };
};
#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"
#include "define.hpp"
#include "visual\empty.hpp"
#include "visual\effects.hpp"