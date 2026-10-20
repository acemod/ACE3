#include "script_component.hpp"
#include "\z\ace\addons\refuel\defines.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"loadorder_f_vietnam", "ace_refuel"};
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"johnb43"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class CBA_Extended_EventHandlers;

#include "CfgVehicles.hpp"
