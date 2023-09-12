#include "script_component.hpp"

// Config will be binerized, so this include is only required at build-time
#include "\z\ace\addons\csw\script_config_macros_csw.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {QGVAR(dshkm_carry)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "rhsgref_main_loadorder",
            "ace_csw"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
