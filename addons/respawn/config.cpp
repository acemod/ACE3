#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {"ACE_Rallypoint_West", "ACE_Rallypoint_East", "ACE_Rallypoint_Independent", "ACE_RallypointExit_West", "ACE_RallypointExit_East", "ACE_RallypointExit_Independent"};
    requiredVersion = 0.60;
    requiredAddons[] = {"ace_core"};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"bux578", "commy2"};
    authorUrl = "https://github.com/bux578/";
  };
};

#include "CfgEventHandlers.hpp"
#include "CfgAddons.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgVehicles.hpp"
