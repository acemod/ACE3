#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "WW2_SPEX_Assets_c_Weapons_InfantryWeapons_c",
            "WW2_SPEX_Assets_c_Characters_Commonwealth_c_UK_Army_Gear",
            "WW2_SPEX_Assets_c_Vehicles_ZZZ_AllVehiclesLoaded_c",
            "ace_common"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"johnb43"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
