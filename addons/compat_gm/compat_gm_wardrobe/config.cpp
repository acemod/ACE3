#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        author = ECSTRING(common,ACETeam);
        authors[] = {"OverlordZorn [CVO]"};
        url = ECSTRING(main,URL);
        
        VERSION_CONFIG;
        addonRootClass = QUOTE(ADDON);
        requiredAddons[] = {
            "ace_wardrobe",
            "gm_core"
        };
        skipWhenMissingDependencies = 1;

        requiredVersion = 2.02;
       
        units[] = {};
        weapons[] = {};
    };
};

#include "CfgWardrobe.hpp"