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

class ACE_Settings {
    class GVAR(optionMenuDisplaySize) {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = "$STR_ACE_optionsMenu_uiScaing";
        values[] = {"$str_medium", "$str_large", "$str_very_large"};
    };
};

class ACE_Extensions {
    extensions[] += {"ace_clipboard"};
};
