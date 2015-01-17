#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"commy2"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class ACE_Default_Keys {
    class safeWeapon {
        displayName = "$STR_ACE_SafeMode_SafeMode";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([ARR_3(_player, currentWeapon _player, currentMuzzle _player)] call FUNC(lockSafety));
        exceptions[] = {"ACE_interaction_isNotEscorting"};
        key = 41;
        shift = 0;
        control = 1;
        alt = 0;
    };
};
