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
    class selectPistol {
        displayName = "$STR_ACE_WeaponSelect_SelectPistol";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([ARR_2(_player, handgunWeapon _player)] call FUNC(selectWeaponMode););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        key = 2;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class selectRifle {
        displayName = "$STR_ACE_WeaponSelect_SelectRifle";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([ARR_2(_player, primaryWeapon _player)] call FUNC(selectWeaponMode););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        key = 3;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class selectLauncher {
        displayName = "$STR_ACE_WeaponSelect_SelectLauncher";
        condition = QUOTE(_player == _vehicle);
        statement = QUOTE([ARR_2(_player, secondaryWeapon _player)] call FUNC(selectWeaponMode););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        key = 5;
        shift = 0;
        control = 0;
        alt = 0;
    };
    /*class selectPistolMuzzle {
        displayName = "Select Pistol Muzzle";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([ARR_2(_player, handgunWeapon _player)] call FUNC(selectWeaponMuzzle););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        disabled = 1;
        key = 7;
        shift = 0;
        control = 0;
        alt = 0;
    };*/
    class selectRifleMuzzle {
        displayName = "$STR_ACE_WeaponSelect_SelectRifleMuzzle";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([ARR_2(_player, primaryWeapon _player)] call FUNC(selectWeaponMuzzle););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        key = 4;
        shift = 0;
        control = 0;
        alt = 0;
    };
    /*class selectLauncherMuzzle {
        displayName = "Select Launcher Muzzle";
        condition = QUOTE(_player == _vehicle);
        statement = QUOTE([ARR_2(_player, secondaryWeapon _player)] call FUNC(selectWeaponMuzzle););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        disabled = 1;
        key = 8;
        shift = 0;
        control = 0;
        alt = 0;
    };*/
    class selectBinocular {
        displayName = "$STR_ACE_WeaponSelect_SelectBinocular";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([ARR_2(_player, binocular _player)] call FUNC(selectWeaponMode););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        key = 6;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class selectGrenadeFrag {
        displayName = "$STR_ACE_WeaponSelect_SelectGrenadeFrag";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([_player] call FUNC(selectGrenadeFrag););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        key = 7;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class selectGrenadeOther {
        displayName = "$STR_ACE_WeaponSelect_SelectGrenadeOther";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([_player] call FUNC(selectGrenadeOther););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        key = 8;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class holsterWeapon {
        displayName = "$STR_ACE_WeaponSelect_HolsterWeapon";
        condition = QUOTE([_player] call EFUNC(common,canUseWeapon));
        statement = QUOTE([_player] call FUNC(putWeaponAway););
        exceptions[] = {QEGVAR(interaction,isNotEscorting)};
        key = 11;
        shift = 0;
        control = 0;
        alt = 0;
    };

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
