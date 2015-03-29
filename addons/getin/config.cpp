#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction", "ace_interact_menu"};
        author[] = {"PabstMirror", "commy2"};
        authorUrl = "https://github.com/ace3";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
