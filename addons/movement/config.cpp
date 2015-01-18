#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"commy2","KoffeinFlummi","Tachii"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFatigue.hpp"
//#include "CfgInventoryGlobalVariable.hpp"
#include "CfgMoves.hpp"

class ACE_Default_Keys {
    class climb {
        displayName = "$STR_ACE_Movement_Climb";
        condition = QUOTE(_player == _vehicle);
        statement = QUOTE([_player] call FUNC(climb););
        key = 47;
        shift = 0;
        control = 1;
        alt = 0;
    };
};

class ACE_Options {
    class useImperial {
        displayName = "$STR_ACE_Movement_UseImperial";
        default = 0;
    };
};
