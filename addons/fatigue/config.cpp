#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"PabstMirror"};
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgFatigue.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"

class RscInGameUI {
    class RscStaminaBar {
        onLoad = "[""onLoad"",_this,""RscStaminaBar"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay');  uiNamespace setVariable ['test5', _this select 0];";
    };
};
