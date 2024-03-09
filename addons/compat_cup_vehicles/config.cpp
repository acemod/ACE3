#include "script_component.hpp"

// Remove after next cup release
#pragma hemtt flag pe23_ignore_has_include
#if __has_include("\cup\CUP_Vehicles_ACE_compat\config.bin")
#define PATCH_SKIP "CUP_Vehicles_ACE_compat"
#endif

#ifdef PATCH_SKIP
ACE_PATCH_NOT_LOADED(ADDON,PATCH_SKIP)
#else
class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "CUP_Vehicles_LoadOrder",
            "ace_interaction"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Community Upgrade Project", "Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

#endif
