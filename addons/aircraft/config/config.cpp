#include "script_component.hpp"

class CfgPatches {
    class DOUBLES(ADDON,heli1) {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QUOTE(ADDON)};
        author[] = {"commy2"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};
