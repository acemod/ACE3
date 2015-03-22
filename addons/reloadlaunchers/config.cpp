#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common","ace_interaction","ace_interact_menu"};
        author[] = {""};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
