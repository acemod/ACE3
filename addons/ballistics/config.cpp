#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_TargetWall"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"TaoSensai","commy2","Ruthberg"};
        authorUrl = "https://github.com/Taosenai/tmr";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"