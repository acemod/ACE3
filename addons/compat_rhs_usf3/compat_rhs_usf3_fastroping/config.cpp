#include "script_component.hpp"

// Config will be binerized, so this include is only required at build-time
#include "\z\ace\addons\fastroping\script_macros.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "rhsusf_main_loadorder",
            "ace_fastroping"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
