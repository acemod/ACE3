#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_CableTie"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_Interaction"};
        author[] = {"commy2", "KoffeinFlummi"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"


class ACE_Core_canInteractConditions {
    class ACE_Interaction_isNotEscorting {
        condition = "!(_player getVariable ['ACE_isEscorting', false])";
    };
    class ACE_Interaction_isNotCaptive {
        condition = "!(_player getVariable ['ACE_isCaptive', false])";
    };
    class ACE_Interaction_isNotSurrendering {
        condition = "!(_player getVariable ['ACE_isSurrender', false])";
    };
};
