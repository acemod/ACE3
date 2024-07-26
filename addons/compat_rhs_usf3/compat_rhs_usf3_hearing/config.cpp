#include "script_component.hpp"
#include "\z\ace\addons\hearing\script_macros_hearingProtection.hpp"

class CfgPatches {
    class SUBADDON {
        addonRootClass = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "rhsusf_main_loadorder",
            "ace_hearing"
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
