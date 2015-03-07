// by CAA-Picard
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
["ACE3", QGVAR(SelectPistol), localize "STR_ACE_WeaponSelect_SelectPistol",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, handgunWeapon ACE_player] call FUNC(selectWeaponMode);
    true
},
{false},
[2, [false, false, false]], false] call cba_fnc_addKeybind; //1 Key

["ACE3", QGVAR(SelectRifle), localize "STR_ACE_WeaponSelect_SelectRifle",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, primaryWeapon ACE_player] call FUNC(selectWeaponMode);
    true
},
{false},
[3, [false, false, false]], false] call cba_fnc_addKeybind; //2 Key

["ACE3", QGVAR(SelectRifleMuzzle), localize "STR_ACE_WeaponSelect_SelectRifleMuzzle",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, primaryWeapon ACE_player] call FUNC(selectWeaponMuzzle);
    true
},
{false},
[4, [false, false, false]], false] call cba_fnc_addKeybind; //3 Key

["ACE3", QGVAR(SelectLauncher), localize "STR_ACE_WeaponSelect_SelectLauncher",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, secondaryWeapon ACE_player] call FUNC(selectWeaponMode);
    true
},
{false},
[5, [false, false, false]], false] call cba_fnc_addKeybind; //4 Key

["ACE3", QGVAR(SelectBinocular), localize "STR_ACE_WeaponSelect_SelectBinocular",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, binocular ACE_player] call FUNC(selectWeaponMode);
    true
},
{false},
[6, [false, false, false]], false] call cba_fnc_addKeybind; //5 Key

["ACE3", QGVAR(SelectGrenadeFrag), localize "STR_ACE_WeaponSelect_SelectGrenadeFrag",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player] call FUNC(selectGrenadeFrag);
    true
},
{false},
[7, [false, false, false]], false] call cba_fnc_addKeybind; //6 Key

["ACE3", QGVAR(SelectGrenadeOther), localize "STR_ACE_WeaponSelect_SelectGrenadeOther",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player] call FUNC(selectGrenadeOther);
    true
},
{false},
[8, [false, false, false]], false] call cba_fnc_addKeybind; //7 Key

["ACE3", QGVAR(HolsterWeapon), localize "STR_ACE_WeaponSelect_HolsterWeapon",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player] call FUNC(putWeaponAway);
    true
},
{false},
[11, [false, false, false]], false] call cba_fnc_addKeybind; //0 Key

["ACE3", QGVAR(EngineOn), localize "STR_ACE_WeaponSelect_EngineOn",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player && {ACE_player == driver vehicle ACE_player} && {!isEngineOn vehicle ACE_player}) exitWith {false};

    // Statement
    (vehicle ACE_player) engineOn true;
    true
},
{false},
[3, [false, false, false]], false] call cba_fnc_addKeybind; //2 Key

["ACE3", QGVAR(EngineOff), localize "STR_ACE_WeaponSelect_EngineOff",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player && {ACE_player == driver vehicle ACE_player} && {isEngineOn vehicle ACE_player}) exitWith {false};

    // Statement
    (vehicle ACE_player) engineOn false;
    true
},
{false},
[2, [false, false, false]], false] call cba_fnc_addKeybind; //1 Key

["ACE3", QGVAR(SelectMainGun), localize "STR_ACE_WeaponSelect_SelectMainGun",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 0] call FUNC(selectWeaponVehicle);
    true
},
{false},
[4, [false, false, false]], false] call cba_fnc_addKeybind; //3 Key

["ACE3", QGVAR(SelectMachineGun), localize "STR_ACE_WeaponSelect_SelectMachineGun",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 1] call FUNC(selectWeaponVehicle);
    true
},
{false},
[5, [false, false, false]], false] call cba_fnc_addKeybind; //4 Key

["ACE3", QGVAR(SelectMissiles), localize "STR_ACE_WeaponSelect_SelectMissiles",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 2] call FUNC(selectWeaponVehicle);
    true
},
{false},
[6, [false, false, false]], false] call cba_fnc_addKeybind; //5 Key

["ACE3", QGVAR(FireSmokeLauncher), localize "STR_ACE_WeaponSelect_FireSmokeLauncher",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player && {ACE_player == commander vehicle ACE_player}) exitWith {false};

    // Statement
    [vehicle ACE_player] call FUNC(fireSmokeLauncher);
    true
},
{false},
[10, [false, false, false]], false] call cba_fnc_addKeybind; //9 Key
