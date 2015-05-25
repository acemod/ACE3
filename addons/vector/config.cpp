#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_Vector"};
        weapons[] = {"ACE_Vector"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Ghost","Hamburger SV","commy2","bux578"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#include "RscInGameUI.hpp"
