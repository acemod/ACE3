#include "script_component.hpp"
#include "\z\ace\addons\hearing\script_macros_hearingProtection.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "WW2_SPE_Assets_c_Weapons_InfantryWeapons_c",
            "WW2_SPE_Assets_c_Vehicles_StaticWeapons_c",
            "WW2_SPE_Assets_c_Vehicles_Weapons_c",
            "WW2_SPE_Core_f_System_StaticWeapons_f",
            "WW2_SPE_Core_c_Core_c_Eventhandlers",
            "ace_hearing"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgWeapons.hpp"
