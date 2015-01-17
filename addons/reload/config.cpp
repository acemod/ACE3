#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"commy2","KoffeinFlummi"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgActions.hpp"

class ACE_Default_Keys {
    class checkAmmo {
        displayName = "$STR_ACE_Reload_checkAmmo";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon) || {_vehicle isKindOf 'StaticWeapon'});
        statement = QUOTE([ARR_3(_player, _vehicle, false)] call FUNC(checkAmmo););
        key = 19;
        shift = 0;
        control = 1;
        alt = 0;
    };
};

#include "RscInGameUI.hpp"
