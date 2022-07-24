#include "script_component.hpp"
#include "\z\ace\addons\csw\script_config_macros_csw.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {QGVAR(m252_carry), QGVAR(m2_carry), QGVAR(mk19_carry), QGVAR(tow_carry)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_explosives", "ace_javelin", "ace_rearm", "ace_refuel", "ace_repair", "ace_csw", "rhsusf_main_loadorder"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg", "GitHawk", "BaerMitUmlaut", "Fyuran"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgGlasses.hpp"
#include "CfgMagazineGroups.hpp"

