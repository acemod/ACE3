#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Aegis_Armor_F_Aegis_APC_Wheeled_01",
            "A3_Aegis_Armor_F_Aegis_APC_Tracked_02",
            "A3_Aegis_Armor_F_Aegis_APC_Tracked_03",
            "A3_Aegis_Weapons_F_Aegis",
            "A3_Aegis_Weapons_F_Aegis_Rifles_CTAR",
            "A3_Aegis_Weapons_F_Aegis_Machineguns_LMG_03",
            "A3_Aegis_Weapons_F_Aegis_Rifles_SPAR_02",
            "ace_realisticnames"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"johnb43"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        // this prevents any patched class from requiring this addon
        addonRootClass = "A3_Characters_F";
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
