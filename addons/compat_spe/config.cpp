#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_common",
            "WW2_SPE_Assets_c_Weapons_InfantryWeapons_c",
            "WW2_SPE_Assets_c_Vehicles_StaticWeapons_c",
            "WW2_SPE_Assets_c_Vehicles_Weapons_c",
            "WW2_SPE_Core_f_System_StaticWeapons_f",
            "WW2_SPE_Core_c_Core_c_Eventhandlers"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {
            "sancron",
            "nomisum",
            "coldfront15/Henderson",
            "BrettMayson"
        };
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Medical_Injuries.hpp"
#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgGlasses.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
