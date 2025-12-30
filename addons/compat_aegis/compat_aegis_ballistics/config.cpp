#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_ballistics",
            "A3_Aegis_Weapons_F_Aegis",
            "A3_Aegis_Weapons_F_Aegis_Rifles_M16",
            "A3_Aegis_Weapons_F_Aegis_Machineguns_MAG",
            "A3_Aegis_Weapons_F_Aegis_Pistols_G17",
            "A3_Aegis_Weapons_F_Aegis_Pistols_Mk26",
            "A3_Aegis_Weapons_F_Aegis_Pistols_Ruger57",
            "A3_Aegis_Weapons_F_Aegis_Shotguns_KSG",
            "A3_Aegis_Weapons_F_Aegis_Shotguns_M4_SSAS",
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"thisconnect"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        // this prevents any patched class from requiring this addon
        addonRootClass = "A3_Characters_F";
    };
};

#include "CfgWeapons.hpp"
