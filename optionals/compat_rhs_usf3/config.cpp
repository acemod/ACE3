#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rhsusf_c_weapons", "rhsusf_c_troops", "rhsusf_c_m1a1", "rhsusf_c_m1a2", "RHS_US_A2_AirImport", "rhsusf_c_m109", "rhsusf_c_hmmwv", "rhsusf_c_rg33", "rhsusf_c_fmtv", "rhsusf_c_m113", "RHS_US_A2Port_Armor"};
        author[]={"Ruthberg", "GitHawk", "BaerMitUmlaut"};
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
