#include "script_component.hpp"

#define RECOMPILE 0

class CfgPatches {
    class ace_finger {
        units[]={};
        weapons[]={};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[]= {"Drill"};
        authorUrl = "https://github.com/TheDrill/";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
