#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author[] = {"commy2", "KoffeinFlummi", "esteldunedain", "bux578"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "Menu_Config.hpp"

class ACE_Settings {
    class GVAR(EnableTeamManagement) {
        value = 1;
        typeName = "BOOL";
    };
};
