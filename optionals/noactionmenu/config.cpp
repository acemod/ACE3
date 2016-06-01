#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        ACE_isOptional = 1;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2"};
        PBO_URL
        VERSION_CONFIG;
    };
};

#include "CfgActions.hpp"
