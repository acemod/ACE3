#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.60;
        requiredAddons[] = { "ace_main", "ace_common", "ace_interaction" };
        version = QUOTE(VERSION);
        versionStr = QUOTE(VERSION);
        versionAr[] = { VERSION_AR };
        author[] = { "commy2", "CAA-Picard" };
        authorUrl = "https://github.com/commy2/";
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

class ACE_Common_Default_Keys {
    class showNames {
        displayName = "$STR_ACE_NameTags_ShowNames";
        condition = "true";
        statement = QUOTE(GVAR(ShowNamesTime) = time; if (call FUNC(canShow)) then{ call FUNC(doShow); };);
        key = 29;
        shift = 0;
        control = 0;
        alt = 0;
        allowHolding = 1;
    };
};

class ACE_Common_Options {
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
