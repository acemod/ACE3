#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {
            "CUP_NVG_PVS14_WP", "CUP_NVG_PVS15_black_WP", "CUP_NVG_PVS15_green_WP", "CUP_NVG_PVS15_tan_WP", "CUP_NVG_PVS15_winter_WP",
            "CUP_NVG_GPNVG_black_WP", "CUP_NVG_GPNVG_tan_WP", "CUP_NVG_GPNVG_green_WP", "CUP_NVG_GPNVG_winter_WP"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "CUP_Weapons_LoadOrder",
            "ace_nightvision"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgWeapons.hpp"
