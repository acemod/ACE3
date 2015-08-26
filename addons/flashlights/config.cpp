#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_Flashlight_MX991", "ACE_Flashlight_KSF1", "ACE_Flashlight_XL50"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"voiper"};
        authorUrl = "https://github.com/voiperr/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
