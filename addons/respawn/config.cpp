#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_Rallypoint_West", "ACE_Rallypoint_East", "ACE_Rallypoint_Independent", "ACE_Rallypoint_West_Base", "ACE_Rallypoint_East_Base", "ACE_Rallypoint_Independent_Base"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "ace_common" };
        author[] = { "bux578", "commy2" };
        authorUrl = "https://github.com/bux578/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAddons.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
