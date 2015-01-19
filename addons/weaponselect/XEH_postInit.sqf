// by CAA-Picard
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
["ACE3",
    localize "STR_ACE_WeaponSelect_SelectPistol",
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
    [2, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectRifle",
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
    [3, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectLauncher",
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
    [5, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectRifleMuzzle",
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
    [4, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectBinocular",
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
    [6, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectGrenadeFrag",
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
    [7, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectGrenadeOther",
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
    [8, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_HolsterWeapon",
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
    [11, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_EngineOn",
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
    [3, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_EngineOff",
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
    [2, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectMainGun",
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
    [4, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectMachineGun",
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
    [5, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_SelectMissiles",
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
    [6, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;

["ACE3",
    localize "STR_ACE_WeaponSelect_FireSmokeLauncher",
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
    [10, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;
