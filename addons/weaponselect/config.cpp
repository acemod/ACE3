#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"commy2","KoffeinFlummi","CAA-Picard"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class ACE_Default_Keys {
    class engineOn {
        displayName = "$STR_ACE_WeaponSelect_EngineOn";
        condition = QUOTE(_player != _vehicle && {_player == driver _vehicle} && {!isEngineOn _vehicle});
        statement = QUOTE(_vehicle engineOn true;);
        key = 3;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class engineOff {
        displayName = "$STR_ACE_WeaponSelect_EngineOff";
        condition = QUOTE(_player != _vehicle && {_player == driver _vehicle} && {isEngineOn _vehicle});
        statement = QUOTE(_vehicle engineOn false;);
        key = 2;
        shift = 0;
        control = 0;
        alt = 0;
    };

    class selectMaingun {
        displayName = "$STR_ACE_WeaponSelect_SelectMainGun";
        condition = QUOTE(_player != _vehicle);
        statement = QUOTE([ARR_3(_player, _vehicle, 0)] call FUNC(selectWeaponVehicle););
        key = 4;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class selectMachineGun {
        displayName = "$STR_ACE_WeaponSelect_SelectMachineGun";
        condition = QUOTE(_player != _vehicle);
        statement = QUOTE([ARR_3(_player, _vehicle, 1)] call FUNC(selectWeaponVehicle););
        key = 5;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class selectMissile {
        displayName = "$STR_ACE_WeaponSelect_SelectMissiles";
        condition = QUOTE(_player != _vehicle);
        statement = QUOTE([ARR_3(_player, _vehicle, 2)] call FUNC(selectWeaponVehicle););
        key = 6;
        shift = 0;
        control = 0;
        alt = 0;
    };

    class fireSmokeLauncher {
        displayName = "$STR_ACE_WeaponSelect_FireSmokeLauncher";
        condition = QUOTE(_player != _vehicle && {_player == commander _vehicle});
        statement = QUOTE([_vehicle] call FUNC(fireSmokeLauncher););
        key = 10;
        shift = 0;
        control = 0;
        alt = 0;
    };
};
