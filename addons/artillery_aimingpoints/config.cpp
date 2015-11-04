#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_M1A2_AimingPost_F","ACE_M1A1_Collimator_F"};
        weapons[] = {"ACE_M1A2_AimingPost", "ACE_M1A1_Collimator"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"