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
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"


class ACE_canInteractConditions {
    class GVAR(isNotEscorting) {
        condition = QUOTE(!(GETVAR(player,QGVAR(isEscorting),false)));
    };
    class GVAR(isNotHandcuffed) {
        condition = QUOTE(!(GETVAR(player,QGVAR(isHandcuffed),false)));
    };
    class GVAR(isNotSurrendering) {
        condition = QUOTE(!(GETVAR(player,QGVAR(isSurrendering),false)));
    };
};
