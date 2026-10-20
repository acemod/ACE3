#include "script_component.hpp"
#include "\z\ace\addons\refuel\defines.hpp"

class CfgPatches {
    class SUBADDON {
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
            "ace_refuel"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Community Upgrade Project", "Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgVehicles.hpp"
