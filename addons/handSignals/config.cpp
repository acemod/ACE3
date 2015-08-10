#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"joko // Jonas" ,"Emperias", "Zigomarvin"};
        authorUrl = "https://github.com/acemod/";
        VERSION_CONFIG;
    };
};
#include "cfgMovesBasic.hpp"
#include "cfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
