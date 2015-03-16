#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_EarBuds"};
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
    class GVAR(EnableCombatDeafness) {
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(EarplugsVolume) {
        value = 0.5;
        typeName = "SCALAR";
    };
    class GVAR(UnconsciousnessVolume) {
        value = 0.4;
        typeName = "SCALAR";
    };
    class GVAR(DisableEarRinging) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 1;
        displayName = "$STR_ACE_Hearing_DisableEarRinging";
    };
};
