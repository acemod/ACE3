#include "script_component.hpp"
#include "\z\ace\addons\refuel\defines.hpp"

// Remove after next cup release
#pragma hemtt flag pe23_ignore_has_include
#if __has_include("\cup\CUP_Terrains_ACE_compat\config.bin")
#define PATCH_SKIP "CUP_Terrains_ACE_compat"
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
            "CABuildings",
            "CAStructuresHouse_A_FuelStation",
            "CAStructures_E_Ind_Ind_FuelStation",
            "CAStructures_PMC_FuelStation",
            "CUP_Buildings_Config",
            "ace_refuel" // not a sub-component because it's all this compat does
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Community Upgrade Project", "Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"

#endif
