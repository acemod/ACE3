#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {""};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
