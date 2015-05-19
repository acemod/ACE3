#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_ballistics"};
        author[] = {"ACE2 Team"};
        authorUrl = "https://www.ace3mod.com";
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
