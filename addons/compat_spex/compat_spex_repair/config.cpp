#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "WW2_SPEX_Assets_c_Vehicles_ZZZ_AllVehiclesLoaded_c",
            "ace_repair"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"johnb43"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgVehicles.hpp"
