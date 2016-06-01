#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"jaynus"};
        PBO_URL;
        VERSION_CONFIG;
    };
};

#include "CfgFontFamilies.hpp"
