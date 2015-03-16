#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_EarPlugs"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interaction"};
        author[] = {"KoffeinFlummi", "CAA-Picard", "HopeJ", "commy2"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"

#include "CfgSounds.hpp"

#include "CfgWeapons.hpp"

#include "CfgAmmo.hpp"

class ACE_Settings {
    class GVAR(DisableEarRinging) {
        default = 1;
        typeName = "BOOL";
        isClientSetable = 1;
        displayName = "$STR_ACE_Hearing_DisableEarRinging";
    };
};
