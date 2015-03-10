#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"commy2","KoffeinFlummi","CAA-Picard"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"

#include "CfgMagazines.hpp"

#include "CfgEventHandlers.hpp"

#include "CfgActions.hpp"

#include "RscInGameUI.hpp"

class ACE_Settings {
    class GVAR(DisplayText) {
        typeName = "BOOL";
        isClientSetable = 1;
        value = 1;
        displayName = "$STR_ACE_reload_SettingDisplayTextName";
        description = "$STR_ACE_reload_SettingDisplayTextDesc";
    };
};

