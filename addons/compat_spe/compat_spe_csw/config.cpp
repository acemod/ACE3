#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(m3Tripod), QGVAR(m2Tripod), QGVAR(LafetteTripodLow), QGVAR(LafetteTripod), QGVAR(m1Baseplate), QGVAR(MLE_27_31_baseplate), QGVAR(GrW278_baseplate)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "WW2_SPE_Assets_c_Weapons_InfantryWeapons_c",
            "WW2_SPE_Assets_c_Vehicles_StaticWeapons_c",
            "WW2_SPE_Assets_c_Vehicles_Weapons_c",
            "WW2_SPE_Core_f_System_StaticWeapons_f",
            "WW2_SPE_Core_c_Core_c_Eventhandlers",
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
