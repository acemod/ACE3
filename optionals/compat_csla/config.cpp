#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_csw", "ace_explosives", "ace_rearm", "ace_refuel", "ace_repair", "CSLA", "US85"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Dahlgren"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
