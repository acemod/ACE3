#include "script_component.hpp"
#include "\z\ace\addons\hearing\script_macros_hearingProtection.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Aegis_Characters_F_Aegis_Headgear",
            "ace_hearing"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"LinkIsGrim"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        // this prevents any patched class from requiring this addon
        addonRootClass = "A3_Characters_F";
    };
};

#include "CfgWeapons.hpp"
