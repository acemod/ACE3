#include "script_component.hpp"

#if __has_include("\rhsafrf\addons\rhs_main\loadorder\config.bin")
#else
    #define PATCH_SKIP "RHS AFRF"
#endif

#if __has_include("\z\ace\addons\refuel\script_component.hpp")
#else
    #ifndef PATCH_SKIP
        #define PATCH_SKIP "ACE Refuel"
    #endif
#endif

#ifdef PATCH_SKIP
ACE_PATCH_NOT_LOADED(ADDON,PATCH_SKIP)
#else

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "rhs_main_loadorder",
            "ace_refuel"
        };
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg", "GitHawk", "BaerMitUmlaut", "commy2", "Skengman2"};
        url = ECSTRING(main,URL);
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"

#endif
