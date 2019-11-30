#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "ACE_Flashlight_MX991Item",
            "ACE_Flashlight_KSF1Item",
            "ACE_Flashlight_XL50Item",
            "ACE_Item_Flashlight_Maglite_ML300L"
        };
        weapons[] = {
            "ACE_Flashlight_MX991",
            "ACE_Flashlight_KSF1",
            "ACE_Flashlight_XL50",
            "ACE_Flashlight_Maglite_ML300L"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"voiper","bux","HorribleGoat"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "ACE_Arsenal_Stats.hpp"
