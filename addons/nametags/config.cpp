#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "ace_main", "ace_common", "ace_interaction" };
        author[] = { "commy2", "CAA-Picard" };
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

class ACE_Settings {
    class GVAR(defaultNametagColor) {
        value[] = {0.77, 0.51, 0.08, 1};
        typeName = "COLOR";
        isClientSetable = 1;
        displayName = "$STR_ACE_NameTags_DefaultNametagColor";
    };
    class GVAR(showPlayerNames) {
        value = 1;
        typeName = "SCALAR";
        isClientSetable = 1;
        displayName = "$STR_ACE_NameTags_ShowPlayerNames";
        values[] = {"Disabled", "Enabled", "Only Cursor", "Only On Keypress", "Only Cursor and KeyPress"};
    };
    class GVAR(showPlayerRanks) {
        value = 1;
        typeName = "BOOL";
        isClientSetable = 1;
        displayName = "$STR_ACE_NameTags_ShowPlayerRanks";
    };
    class GVAR(showVehicleCrewInfo) {
        value = 1;
        typeName = "BOOL";
        isClientSetable = 1;
        displayName = "$STR_ACE_NameTags_ShowVehicleCrewInfo";
    };
    class GVAR(showNamesForAI) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 1;
        displayName = "$STR_ACE_NameTags_ShowNamesForAI";
    };    
    class GVAR(showCursorTagForVehicles) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(showSoundWaves) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 1;
        displayName = "$STR_ACE_NameTags_ShowSoundWaves";
    };
    class GVAR(PlayerNamesViewDistance) {
        value = 5;
        typeName = "SCALAR";
        isClientSetable = 0;
    };
    class GVAR(PlayerNamesMaxAlpha) {
        value = 0.8;
        typeName = "SCALAR";
        isClientSetable = 0;
    };
};

#include <RscTitles.hpp>
