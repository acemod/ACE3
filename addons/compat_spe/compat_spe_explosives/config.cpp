#include "script_component.hpp"

#if __has_include("\WW2\SPE_Core_c\ZZZ_LastLoaded_c\config.bin")
#else
    #define PATCH_SKIP "Spearhead 1944"
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
            "ww2_spe_assets_c_weapons_infantryweapons_c",
            "ww2_spe_assets_c_vehicles_staticweapons_c",
            "ww2_spe_assets_c_vehicles_weapons_c",
            "ww2_spe_core_f_system_staticweapons_f",
            "ww2_spe_core_c_core_c_eventhandlers",
            "ace_explosives"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgMagazines.hpp"

#endif
