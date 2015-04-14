#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Pabst Mirror"};
        authorUrl = "https://github.com/PabstMirror/";
        VERSION_CONFIG;
    };
};

#include "RscDisplayInventory.hpp"

class ACE_Settings {
    class GVAR(inventoryDisplaySize) {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Inventory_SettingName";
        description = "$STR_ACE_Inventory_SettingDescription";
        values[] = {"Normal (Default Size)", "Medium", "Bigger"};
    };
};

