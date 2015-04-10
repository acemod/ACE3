#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_laser"};
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgWeapons.hpp"