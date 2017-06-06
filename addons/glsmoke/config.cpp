#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Willard"};
        authorUrl = "https://github.com/TheNiner";
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
