#include "script_component.hpp"
#include "\z\ace\addons\hearing\script_macros_hearingProtection.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "WW2_SPE_Core_c_ZZZ_LastLoaded_c",
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
