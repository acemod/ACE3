#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Dystopian"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};
