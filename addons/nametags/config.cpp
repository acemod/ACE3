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
        displayName = "$STR_ACE_CrewInfo_ShowVehicleCrewInfo";
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
    class GVAR(CrewInfoVisibility) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(ShowNamesForAI) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
};

#include <RscTitles.hpp>
