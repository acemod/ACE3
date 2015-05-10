#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_SpareBarrel"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"commy2", "KoffeinFlummi", "esteldunedain"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgSounds.hpp"

#include "CfgVehicles.hpp"

#include "CfgWeapons.hpp"

class ACE_Settings {
    class GVAR(DisplayTextOnJam) {
        typeName = "BOOL";
        isClientSettable = 1;
        value = 1;
        displayName = "$STR_ACE_overheating_SettingDisplayTextName";
        description = "$STR_ACE_overheating_SettingDisplayTextDesc";
    };
    class GVAR(enableRefractEffect) {
        typeName = "BOOL";
        value = 0;
    };
};

