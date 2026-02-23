#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_csw",
            "ace_mk6mortar",
            "gm_weapons_ammo",
            "gm_weapons_launchers_milan",
            "gm_weapons_launchers_fagot",
            "gm_weapons_machineguns_mg3_gm_ge_army_mg3",
            "gm_weapons_launchers_fagot_gm_gc_army_fagot"
        };
        units[] = {
          "gm_ge_army_milan_launcher_tripod_csw",
          "gm_gc_army_fagot_launcher_tripod_csw",
          "gm_ge_army_mg3_aatripod_csw",
          QGVAR(MG3Tripod)
        };
        weapons[] = {
          QGVAR(milan_backpack),
          QGVAR(9k111_backpack),
          QGVAR(MG3TripodCarry),
          QGVAR(milan_launcher_proxy),
          QGVAR(9k111_launcher_proxy)
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Lambda.Tiger"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "ACE_CSW_Groups.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
