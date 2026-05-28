#include "script_component.hpp"
#include "\z\ace\addons\hearing\script_macros_hearingProtection.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "WW2_SPEX_Assets_c_Characters_Commonwealth_c_PL_Army_Gear",
            "WW2_SPEX_Assets_c_Characters_Commonwealth_c_UK_Army_Gear",
            "WW2_SPEX_Assets_c_Characters_Germans_c_GER_DAK_Gear",
            "ace_hearing"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"johnb43"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgWeapons.hpp"
