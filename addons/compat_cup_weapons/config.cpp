#include "script_component.hpp"

// Remove after next cup release
#pragma hemtt flag pe23_ignore_has_include
#if __has_include("\cup\CUP_Weapons_ACE_compat\config.bin")
#define PATCH_SKIP "CUP Compat"
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
        requiredAddons[] = {"CUP_Weapons_LoadOrder"};
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Community Upgrade Project", "Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgEventHandlers.hpp"

#endif
