#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_bft_devices"};
        author[] = {"Gundy", "Glowbal"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"

// General UI defines and controls from our shared framework for bft devices
#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"
#include "\z\ace\addons\bft_devices\UI\defines\shared_controls.hpp"

#include "ACE_BFT.hpp"

#include "UI\defines\DK10_defines.hpp"
#include "UI\defines\DK10_dialog.hpp"

// Displays
class RscTitles {
    titles[]={};
    // include any display defines here
};
