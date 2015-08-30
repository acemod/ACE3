#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Pabst Mirror"};
        authorUrl = "https://github.com/PabstMirror/";
        VERSION_CONFIG;
    };
};

#include "RscDisplayInventory.hpp"
#include "ACE_Settings.hpp"
