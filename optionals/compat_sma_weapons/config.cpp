#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"SMA_StandardAmmo","Scar_Arma3","SMA_Weapons_A3","SMA_HK416","SMA_M4","SMA_MK18"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Kwinno"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"