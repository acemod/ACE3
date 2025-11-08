#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_wardrobe",
            "CUP_Creatures_People_LoadOrder"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"OverlordZorn [CVO]", "Andx [TTT]"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        addonRootClass = QUOTE(ADDON);
    };
};

// For Consistency: Adjust Mass/containerSize
//#include "CfgWeapons.hpp"

// ACE Wardrobe
#include "ACE_Wardrobe.hpp"
