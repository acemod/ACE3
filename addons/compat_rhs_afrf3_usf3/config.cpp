#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "rhs_main_loadorder", "rhsusf_main_loadorder"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"OverlordZorn [CVO]"};
        url = ECSTRING(main,URL);
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};