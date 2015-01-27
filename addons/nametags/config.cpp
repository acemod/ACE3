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

class ACE_Options {
    class GVAR(showPlayerNames) {
        displayName = "$STR_ACE_NameTags_ShowPlayerNames";
        values[] = {"Disabled", "Enabled", "Only Cursor", "Only On Keypress", "Only Cursor and KeyPress"};
        default = 1;
    };
    class GVAR(showPlayerRanks) {
        displayName = "$STR_ACE_NameTags_ShowPlayerRanks";
        default = 1;
    };
    class GVAR(showVehicleCrewInfo) {
        displayName = "$STR_ACE_CrewInfo_ShowVehicleCrewInfo";
        default = 1;
    };
};

class ACE_Parameters_Numeric {
    GVAR(PlayerNamesViewDistance) = 5;
    GVAR(PlayerNamesMaxAlpha) = 0.8;
    GVAR(CrewInfoVisibility) = 0;
};
class ACE_Parameters_Boolean {
    GVAR(ShowNamesForAI) = 0;
};

#include <RscTitles.hpp>
