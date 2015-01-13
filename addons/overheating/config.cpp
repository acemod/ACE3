#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_SpareBarrel"};
        requiredVersion = 0.60;
        requiredAddons[] = {ACE_Core, ACE_Interaction};
        version = "0.95";
        versionStr = "0.95";
        versionAr[] = {0,95,0};
        author[] = {"commy2", "KoffeinFlummi", "CAA-Picard"};
        authorUrl = "https://github.com/commy2/";
    };
};

#include "CfgEventHandlers.hpp"

class ACE_Core_Default_Keys {
    class clearJam {
        displayName = "$STR_ACE_Overheating_UnjamWeapon";
        condition = QUOTE( [_player] call EFUNC(core,canUseWeapon) && {currentWeapon _player in (_player getVariable [QUOTE(QGVAR(jammedWeapons)), []])} );
        statement = QUOTE( [_player, currentMuzzle _player, false] call FUNC(clearJam); );
        key = 19;
        shift = 1;
        control = 0;
        alt = 0;
    };
};

#include "CfgSounds.hpp"

#include "CfgVehicles.hpp"

#include "CfgWeapons.hpp"
