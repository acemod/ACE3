#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_MapTools"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"esteldunedain"};
        authorUrl = "https://github.com/esteldunedain/";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"

class RscControlsGroup;
class RscActiveText;
class RscPicture;
class RscText;
class RscObject;
class RscButton;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscButtonMenu;
class RscEdit;

#include "MapGpsUI.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"


// REGULAR MAP
class RscDisplayMainMap {
    // Create the drawing color selector
    class controls {
        class TopRight: RscControlsGroup {
            #include "MapControls.hpp"
        };
    };
};

// BRIEFING SCREEN
class RscDisplayGetReady: RscDisplayMainMap {
    // Create the drawing color selector
    class controls {
        class TopRight: RscControlsGroup {
            #include "MapControls.hpp"
        };
    };
};
class RscDisplayClientGetReady: RscDisplayGetReady {
    // Create the drawing color selector
    class controls {
        class TopRight: RscControlsGroup {
            #include "MapControls.hpp"
        };
    };
};
class RscDisplayServerGetReady: RscDisplayGetReady {
    // Create the drawing color selector
    class controls {
        class TopRight: RscControlsGroup {
            #include "MapControls.hpp"
        };
    };
};
