#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_compat_cwr3_baf_weapons",
            "ace_csw"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"CWR3", "drofseh"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgMagazines.hpp"
#include "CfgMagazineGroups.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
