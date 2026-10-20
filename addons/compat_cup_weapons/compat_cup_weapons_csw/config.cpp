#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"CUP_2b14_carry", "CUP_m252_carry", "CUP_l16a2_carry", "CUP_m2_carry", "CUP_DSHKM_carry", "CUP_KORD_carry", "CUP_AGS30_carry", "CUP_MK19_carry", "CUP_TOW_carry", "CUP_TOW2_carry", "CUP_SPG9_carry"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "CUP_Weapons_LoadOrder",
            "ace_csw"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgMagazines.hpp"
#include "CfgMagazineGroups.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
