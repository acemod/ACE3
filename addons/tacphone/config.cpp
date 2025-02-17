#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KJW"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ace_tacphone_apps.hpp"
#include "CfgEventHandlers.hpp"
#include "gui.hpp"