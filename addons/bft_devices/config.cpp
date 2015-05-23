#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_bft"};
        author[] = {"$STR_ACE_Common_ACETeam"};
        authorUrl = "http://ace3mod.com";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"

// General UI defines and controls
#include "UI\defines\shared_defines.hpp"
#include "UI\defines\shared_controls.hpp"

// Defines
#include "UI\defines\DK10_defines.hpp"
#include "UI\defines\GD300_defines.hpp"
#include "UI\defines\JV5_defines.hpp"
#include "UI\defines\TAD_defines.hpp"

// Dialogs
#include "UI\defines\DK10_dialog.hpp"
#include "UI\defines\GD300_dialog.hpp"
#include "UI\defines\JV5_dialog.hpp"
#include "UI\defines\TAD_dialog.hpp"

// Displays
class RscTitles {
    titles[]={};
    #include "UI\defines\GD300_display.hpp"
    #include "UI\defines\TAD_display.hpp"
};