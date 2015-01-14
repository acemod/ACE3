#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_TargetWall"};
        weapons[] = {"ACE_muzzle_mzls_H","ACE_muzzle_mzls_B","ACE_muzzle_mzls_L","ACE_muzzle_mzls_smg_01","ACE_muzzle_mzls_smg_02"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"TaoSensai","commy2"};
        authorUrl = "https://github.com/Taosenai/tmr";
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
