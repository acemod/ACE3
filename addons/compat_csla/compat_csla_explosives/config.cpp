#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_explosives", "CSLA", "US85"};
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Dahlgren"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
