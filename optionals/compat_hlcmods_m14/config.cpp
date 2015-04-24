#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"hlcweapons_m14"};
        author[]={"Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
