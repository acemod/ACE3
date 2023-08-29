#include "script_component.hpp"

#if __has_include("\rhssaf\addons\rhssaf_main\loadorder\config.bin")
#else
    #define PATCH_SKIP "RHS SAF"
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
            "rhssaf_main_loadorder",
            "ace_explosives"
        };
        author = ECSTRING(common,ACETeam);
        authors[] = {};
        url = ECSTRING(main,URL);
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"

#endif
