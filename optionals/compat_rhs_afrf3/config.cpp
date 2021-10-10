#include "script_component.hpp"
#include "\z\ace\addons\csw\script_config_macros_csw.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_explosives", "ace_csw", "ace_rearm", "ace_refuel", "ace_repair", "rhs_main_loadorder"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg", "GitHawk", "BaerMitUmlaut", "commy2", "Skengman2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgMagazineGroups.hpp"
