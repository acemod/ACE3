#include "script_component.hpp"

#if __has_include("\rhsafrf\addons\rhs_main\loadorder\config.bin")
#else
    #define PATCH_SKIP "RHS AFRF"
#endif

#if __has_include("\z\ace\addons\fastroping\script_component.hpp")
#include "\z\ace\addons\fastroping\script_macros.hpp"
#else
    #ifndef PATCH_SKIP
        #define PATCH_SKIP "ACE Fastroping"
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
            "ace_fastroping"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"

#endif
