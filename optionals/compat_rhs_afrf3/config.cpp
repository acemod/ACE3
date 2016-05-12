#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rhs_c_weapons", "rhs_c_troops", "rhs_c_bmd", "rhs_c_bmp", "rhs_c_bmp3", "rhs_c_a2port_armor", "rhs_c_btr", "rhs_c_sprut", "rhs_c_t72", "rhs_c_tanks", "rhs_c_a2port_air", "rhs_c_a2port_car", "rhs_c_cars", "rhs_c_2s3", "rhs_c_rva"};
        author[]={"Ruthberg", "GitHawk", "BaerMitUmlaut"};
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
