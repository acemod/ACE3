#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main"};
        author[] = {"jaynus"};
        authorUrl = "https://github.com/jaynus/";
        VERSION_CONFIG;
    };
};

#include "CfgFontFamilies.hpp"
