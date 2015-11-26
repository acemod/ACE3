#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"BIS"};
        VERSION_CONFIG;
    };
};

#include "CfgAnimStamina.hpp"
#include "CfgEventHandlers.hpp"
