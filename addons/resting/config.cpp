#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"KoffeinFlummi", "TaoSensai"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class ACE_Default_Keys {
    class restWeapon {
        displayName = "$STR_ACE_Resting_RestWeapon";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon) && {inputAction 'reloadMagazine' == 0} && {!weaponLowered _player} && {speed _player < 1});
        statement = QUOTE([ARR_3(_player, _vehicle, currentWeapon _player)] call FUNC(restWeapon));
        key = 15;
        shift = 0;
        control = 0;
        alt = 0;
    };
};

#include "CfgWeapons.hpp"

#include "CfgMoves.hpp"
