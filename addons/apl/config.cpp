#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main"};
        author = "Bohemia Interactive";
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};
