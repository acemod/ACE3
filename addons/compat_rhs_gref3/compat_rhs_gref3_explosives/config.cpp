#include "script_component.hpp"

#if __has_include("\rhsgref\addons\rhsgref_main\loadorder\config.bin")
#else
    #define PATCH_SKIP "RHS GREF"
#endif

#if __has_include("\z\ace\addons\explosives\script_component.hpp")
#else
    #ifndef PATCH_SKIP
        #define PATCH_SKIP "ACE Explosives"
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
            "rhsgref_main_loadorder",
            "ace_explosives"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"

#endif
