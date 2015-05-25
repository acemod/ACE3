#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_moduleAllowConfigExport"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Glowbal", "PabstMirror"};
        authorUrl = "http://github.com/Glowbal";
        VERSION_CONFIG;
    };
};

class CfgAddons {
    class PreloadAddons {
        class ADDON {
            list[] = {QUOTE(ADDON)};
        };
    };
};


#include "CfgEventHandlers.hpp"
#include "gui\define.hpp"
#include "gui\settingsMenu.hpp"
#include "gui\pauseMenu.hpp"

#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"

class ACE_Extensions {
    extensions[] += {"ace_clipboard"};
};
