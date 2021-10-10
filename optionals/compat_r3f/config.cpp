#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"r3f_armes_c", "r3f_acc", "R3F_G17_addons", "R3F_G_SCAR", "R3F_SCAR_H", "R3F_SCAR_L", "R3F_FN_MAG"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
