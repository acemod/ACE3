#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F"};
        author[] = {"jaynus"};
        authorUrl = "https://github.com/walterperace/";
        VERSION_CONFIG;
    };
};

#include "ACE_Penetration.hpp"
#include "CfgAmmo.hpp"
