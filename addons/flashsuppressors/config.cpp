#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {
            "ACE_muzzle_mzls_H",
            "ACE_muzzle_mzls_B",
            "ACE_muzzle_mzls_L",
            "ACE_muzzle_mzls_smg_01",
            "ACE_muzzle_mzls_smg_02",
            "ACE_muzzle_mzls_338",
            "ACE_muzzle_mzls_93mmg"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
