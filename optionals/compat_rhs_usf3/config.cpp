#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_javelin", "ace_rearm", "ace_refuel", "ace_repair", "rhsusf_c_weapons", "rhsusf_c_troops", "rhsusf_c_m1a1", "rhsusf_c_m1a2", "RHS_US_A2_AirImport", "rhsusf_c_m109", "rhsusf_c_HEMTT_A4", "rhsusf_c_hmmwv", "rhsusf_c_rg33", "rhsusf_c_fmtv", "rhsusf_c_m113", "RHS_US_A2Port_Armor", "rhsusf_c_melb"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg", "GitHawk", "BaerMitUmlaut"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgGlasses.hpp"
