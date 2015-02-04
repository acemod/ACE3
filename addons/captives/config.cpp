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

#define GVARFIX(var1) getVariable [ARR_2(QUOTE(GVAR(var1)), false)]


class ACE_canInteractConditions {
    class GVAR(isNotEscorting) {
        condition = QUOTE(!(GETVAR(player,QGVAR(isEscorting),false)));
    };
    class GVAR(isNotCaptive) {
        condition = QUOTE(!(GETVAR(player,QGVAR(isCaptive),false)));
    };
    class GVAR(isNotSurrendering) {
        condition = QUOTE(!(GETVAR(player,QGVAR(isSurrender),false)));
    };
};
