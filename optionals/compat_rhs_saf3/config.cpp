#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rhssaf_main"};
        author = ECSTRING(common,ACETeam);
        authors[] = {};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};
