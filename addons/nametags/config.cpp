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
    class showPlayerNames {
        displayName = "$STR_ACE_NameTags_ShowPlayerNames";
        default = 1;
    };
    class showPlayerNamesOnlyOnCursor {
        displayName = "$STR_ACE_NameTags_ShowPlayerNamesOnlyOnCursor";
        default = 1;
    };
    class showPlayerNamesOnlyOnKeyPress {
        displayName = "$STR_ACE_NameTags_ShowPlayerNamesOnlyOnKeyPress";
        default = 0;
    };
    class showPlayerRanks {
        displayName = "$STR_ACE_NameTags_ShowPlayerRanks";
        default = 1;
    };
    class showVehicleCrewInfo {
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
