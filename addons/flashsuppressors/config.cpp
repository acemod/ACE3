#include "script_component.hpp"

class CfgPatches {
    class ADDON {
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
        author[] = {"commy2"};
        authorUrl = "https://github.com/commy2";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
