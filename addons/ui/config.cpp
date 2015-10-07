#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"VKing", "Jonpas"};
        authorUrl = "http://ace3mod.com/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"

#include "RscChat.hpp"
#include "RscVignette.hpp"
