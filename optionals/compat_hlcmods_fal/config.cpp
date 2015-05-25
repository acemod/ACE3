#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"hlcweapons_falpocalypse"};
        author[]={"Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
