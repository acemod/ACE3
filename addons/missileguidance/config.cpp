#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Comanche_Test"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_laser"};
        VERSION_CONFIG;
    };
};

#include "ACE_GuidanceConfig.hpp"
#include "ACE_Settings.hpp"

#include "CfgEventhandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
