// by esteldunedain
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
["ACE3 Weapons", QGVAR(SelectPistolNew), localize "STR_ACE_WeaponSelect_SelectPistol",
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, handgunWeapon ACE_player] call FUNC(selectWeaponMode);
    false
},
{false},
[0, [false, false, false]], false] call cba_fnc_addKeybind; //Unbound (was 1 Key)

["ACE3 Weapons", QGVAR(SelectRifleNew), localize "STR_ACE_WeaponSelect_SelectRifle",
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, primaryWeapon ACE_player] call FUNC(selectWeaponMode);
    false
},
{false},
[0, [false, false, false]], false] call cba_fnc_addKeybind; //Unbound (was 2 Key)

["ACE3 Weapons", QGVAR(SelectRifleMuzzleNew), localize "STR_ACE_WeaponSelect_SelectRifleMuzzle",
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, primaryWeapon ACE_player] call FUNC(selectWeaponMuzzle);
    false
},
{false},
[0, [false, false, false]], false] call cba_fnc_addKeybind; //Unbound (was 3 Key)

["ACE3 Weapons", QGVAR(SelectLauncherNew), localize "STR_ACE_WeaponSelect_SelectLauncher",
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, secondaryWeapon ACE_player] call FUNC(selectWeaponMode);
    false
},
{false},
[0, [false, false, false]], false] call cba_fnc_addKeybind; //Unbound (was 4 Key)

["ACE3 Weapons", QGVAR(SelectBinocularNew), localize "STR_ACE_WeaponSelect_SelectBinocular",
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, binocular ACE_player] call FUNC(selectWeaponMode);
    false
},
{false},
[0, [false, false, false]], false] call cba_fnc_addKeybind; //Unbound (was 5 Key)

["ACE3 Weapons", QGVAR(SelectGrenadeFrag), localize "STR_ACE_WeaponSelect_SelectGrenadeFrag",
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player] call FUNC(selectGrenadeFrag);
    true
},
{false},
[7, [false, false, false]], false] call cba_fnc_addKeybind; //6 Key

["ACE3 Weapons", QGVAR(SelectGrenadeOther), localize "STR_ACE_WeaponSelect_SelectGrenadeOther",
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player] call FUNC(selectGrenadeOther);
    true
},
{false},
[8, [false, false, false]], false] call cba_fnc_addKeybind; //7 Key

["ACE3 Weapons", QGVAR(HolsterWeapon), localize "STR_ACE_WeaponSelect_HolsterWeapon",
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player] call FUNC(putWeaponAway);
    true
},
{false},
[11, [false, false, false]], false] call cba_fnc_addKeybind; //0 Key

["ACE3 Vehicles", QGVAR(EngineOn), localize "STR_ACE_WeaponSelect_EngineOn",
{
    // Conditions: canInteract
    if !([ACE_player, (vehicle ACE_player), []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !((ACE_player != vehicle ACE_player) && {ACE_player == driver vehicle ACE_player} && {!isEngineOn vehicle ACE_player}) exitWith {false};

    // Statement
    (vehicle ACE_player) engineOn true;
    true
},
{false},
[3, [false, false, false]], false] call cba_fnc_addKeybind; //2 Key

["ACE3 Vehicles", QGVAR(EngineOff), localize "STR_ACE_WeaponSelect_EngineOff",
{
    // Conditions: canInteract
    if !([ACE_player, (vehicle ACE_player), []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player && {ACE_player == driver vehicle ACE_player} && {isEngineOn vehicle ACE_player}) exitWith {false};

    // Statement
    (vehicle ACE_player) engineOn false;
    true
},
{false},
[2, [false, false, false]], false] call cba_fnc_addKeybind; //1 Key

["ACE3 Vehicles", QGVAR(SelectMainGunNew), localize "STR_ACE_WeaponSelect_SelectMainGun",
{
    // Conditions: canInteract
    if !([ACE_player, (vehicle ACE_player), []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 0] call FUNC(selectWeaponVehicle);
    true
},
{false},
[0, [false, false, false]], false] call cba_fnc_addKeybind; //Unbound (was 3 Key)

["ACE3 Vehicles", QGVAR(SelectMachineGunNew), localize "STR_ACE_WeaponSelect_SelectMachineGun",
{
    // Conditions: canInteract
    if !([ACE_player, (vehicle ACE_player), []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 1] call FUNC(selectWeaponVehicle);
    true
},
{false},
[0, [false, false, false]], false] call cba_fnc_addKeybind; //Unbound (was 4 Key)

["ACE3 Vehicles", QGVAR(SelectMissilesNew), localize "STR_ACE_WeaponSelect_SelectMissiles",
{
    // Conditions: canInteract
    if !([ACE_player, (vehicle ACE_player), []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 2] call FUNC(selectWeaponVehicle);
    true
},
{false},
[0, [false, false, false]], false] call cba_fnc_addKeybind; //Unbound (was 5 Key)

["ACE3 Vehicles", QGVAR(FireSmokeLauncher), localize "STR_ACE_WeaponSelect_FireSmokeLauncher",
{
    // Conditions: canInteract
    if !([ACE_player, (vehicle ACE_player), []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player && {ACE_player == commander vehicle ACE_player}) exitWith {false};

    // Statement
    [vehicle ACE_player] call FUNC(fireSmokeLauncher);
    true
},
{false},
[10, [false, false, false]], false] call cba_fnc_addKeybind; //9 Key
