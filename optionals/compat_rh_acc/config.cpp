#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"RH_acc"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg"};
        url = "http://ace3mod.com";
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
