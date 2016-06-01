#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"RKSL_PMII"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg"};
        PBO_URL;
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
