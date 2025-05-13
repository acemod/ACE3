#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"UK3CB_Factions_Weapons"};
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Andx"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};


#include "CfgVehicles.hpp"
