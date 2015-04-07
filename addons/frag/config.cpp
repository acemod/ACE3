#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "A3_Misc_F", "A3_Weapons_F" };
        author[] = {"Nou"};
        VERSION_CONFIG;
    };
};

//PRELOAD_ADDONS;

#include "CfgEventhandlers.hpp"
#include "CfgAmmo.hpp"
