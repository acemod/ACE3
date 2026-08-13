#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "WW2_SPEX_Assets_c_Characters_Americans_c_US_Airborne_Gear",
            "WW2_SPEX_Assets_c_Characters_Commonwealth_c_AUS_trop_Gear",
            "WW2_SPEX_Assets_c_Characters_Commonwealth_c_PL_Army_Gear",
            "WW2_SPEX_Assets_c_Characters_Commonwealth_c_UK_Airborne_Gear",
            "WW2_SPEX_Assets_c_Characters_Commonwealth_c_UK_Army_Gear",
            "WW2_SPEX_Assets_c_Characters_Germans_c_GER_DAK_Gear",
            "WW2_SPEX_Assets_c_Characters_Germans_c_LW_DAK_Gear",
            "ace_wardrobe",
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"johnb43"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        addonRootClass = QUOTE(ADDON);
    };
};

// ACE Wardrobe
#include "ACE_wardrobe.hpp"
