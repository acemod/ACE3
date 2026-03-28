#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_compat_cwr3",
            "cwr3_expansion_uk",
            "cwr3_soldiers_uk"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"CWR3", "drofseh"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

// #include "CfgAmmo.hpp" // Uncomment when CWR3 updates
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"

#include "ace_wardrobe.hpp"
