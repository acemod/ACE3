#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "CUP_CAStructures_E_Misc_Misc_Interier",
            "CUP_CAStructures_E_Misc_Misc_Market",
            "CUP_Editor_Buildings_Config",
            "CUP_Editor_Structures_Config",
            "CUP_Misc3_Config",
            "ace_common"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Community Upgrade Project", "Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"
