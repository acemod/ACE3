#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author[] = {"joko // Jonas", "Emperias", "Zigomarvin"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgMovesBasic.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
