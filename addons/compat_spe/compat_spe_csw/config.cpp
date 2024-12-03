#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ww2_spe_assets_c_weapons_infantryweapons_c",
            "ww2_spe_assets_c_vehicles_staticweapons_c",
            "ww2_spe_assets_c_vehicles_weapons_c",
            "ww2_spe_core_f_system_staticweapons_f",
            "ww2_spe_core_c_core_c_eventhandlers",
            "ace_csw"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgMagazines.hpp"
#include "CfgMagazineGroups.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

class CfgFunctions {
    class SPE_WEAPONS_STATIC {
        class SPE_Weapons_Static {
            OVERWRITE_FUNC(alter_height);
            OVERWRITE_FUNC(can_alter_height);
            OVERWRITE_FUNC(can_assemble_weapon);
            OVERWRITE_FUNC(can_disassemble_weapon);
            OVERWRITE_FUNC(can_prepare_ammo);
            OVERWRITE_FUNC(can_Reload);
            OVERWRITE_FUNC(can_resupply_ammo);
            OVERWRITE_FUNC(can_unload_ammo);
        };
    };
};
