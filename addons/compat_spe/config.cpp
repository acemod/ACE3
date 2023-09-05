#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_common",
            "ww2_spe_assets_c_weapons_infantryweapons_c",
            "ww2_spe_assets_c_vehicles_staticweapons_c",
            "ww2_spe_assets_c_vehicles_weapons_c",
            "ww2_spe_core_f_system_staticweapons_f",
            "ww2_spe_core_c_core_c_eventhandlers"
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
