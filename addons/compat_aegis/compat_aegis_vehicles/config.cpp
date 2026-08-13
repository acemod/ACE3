#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Aegis_Armor_F_Aegis_MBT_01",
            "A3_Aegis_Armor_F_Aegis_MBT_04",
            "A3_Aegis_Armor_F_Aegis_APC_Tracked_03",
            "ace_vehicles"
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
