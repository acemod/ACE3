#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main"};
        author = "Bohemia Interactive";
        url = "https://www.bistudio.com/";
        VERSION_CONFIG;
    };
};
