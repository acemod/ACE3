#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_wardrobe",
            "EF_Props",
            "EF_Marines"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Andx [TTT]"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        addonRootClass = QUOTE(ADDON);
    };
};

// ACE Wardrobe
#include "ace_wardrobe.hpp"
