#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interaction", "ace_dragging", "A3_Weapons_F"};
        author[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgAmmo.hpp"