#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"hlcweapons_ar15"};
        author[]={"Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
