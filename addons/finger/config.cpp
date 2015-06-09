#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(moduleSettings)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Drill"};
        authorUrl = "https://github.com/TheDrill/";
        VERSION_CONFIG;
    };
};


#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
