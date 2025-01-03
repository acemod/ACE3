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
            "Characters_f_lxWS_headgear"
        };
        skipWhenMissingDependencies = 1;

        requiredVersion = REQUIRED_VERSION;
       
        units[] = {};
        weapons[] = {};
    };
};


#include "CfgWardrobe.hpp"