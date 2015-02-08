#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};// "ACE_Kestrel4500" };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"q1184", "Rocko", "CAA-Picard"};
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"

#include "CfgWorlds.hpp"
