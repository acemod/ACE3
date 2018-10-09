#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal", "PabstMirror"};
        url = ECSTRING(main,URL);
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
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"

#include "gui\mainMenu.hpp"
#include "gui\pauseMenu.hpp"

class ACE_Extensions {
    extensions[] += {"ace_clipboard"};
};

class CfgCommands {
    allowedHTMLLoadURIs[] += {
        "https://ace3mod.com/version.html"
    };
};
