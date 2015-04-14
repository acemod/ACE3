#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Comanche_Test"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"KoffeinFlummi","Crusty","commy2","jaynus","Kimi"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscInGameUI.hpp"