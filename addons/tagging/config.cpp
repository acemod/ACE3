#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_SpraypaintBlack", "ACE_Item_SpraypaintRed", "ACE_Item_SpraypaintGreen", "ACE_Item_SpraypaintBlue"};
        weapons[] = {"ACE_SpraypaintBlack", "ACE_SpraypaintRed", "ACE_SpraypaintGreen", "ACE_SpraypaintBlue"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"BaerMitUmlaut"};
        authorUrl = "https://github.com/BaerMitUmlaut";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"