#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"jaynus"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};
#include "CfgCloudlets.hpp"
#include "CfgSounds.hpp"

#include "CfgVehicles.hpp"
#include "CfgAmmo.hpp"

#include "CfgEventHandlers.hpp"
