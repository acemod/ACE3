#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"commy2","KoffeinFlummi","esteldunedain"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class ACE_Settings {
    class GVAR(DisplayText) {
        typeName = "BOOL";
        isClientSettable = 1;
        value = 1;
        displayName = "$STR_ACE_Weaponselect_SettingDisplayTextName";
        description = "$STR_ACE_Weaponselect_SettingDisplayTextDesc";
    };
};
