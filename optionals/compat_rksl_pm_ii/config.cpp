#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"RKSL_PMII"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg"};
        url = "http://ace3mod.com";
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
