#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_modules"};
        author[] = {"q1184", "Rocko", "esteldunedain", "Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"
#include "CfgWorlds.hpp"
#include "RscTitles.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"