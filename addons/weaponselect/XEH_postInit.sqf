// by esteldunedain
#include "script_component.hpp"

if (!hasInterface) exitWith {};

// add keybinds
["ACE3 Weapons", QGVAR(SelectPistolNew), localize LSTRING(SelectPistol), {
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotInside", "isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    // Statement
    [ACE_player, handgunWeapon ACE_player] call FUNC(selectWeaponMode);
    false
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind; //Unbound (was 1 Key)

["ACE3 Weapons", QGVAR(SelectRifleNew), localize LSTRING(SelectRifle), {
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotInside", "isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    // Statement
    [ACE_player, primaryWeapon ACE_player] call FUNC(selectWeaponMode);
    false
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind; //Unbound (was 2 Key)

["ACE3 Weapons", QGVAR(SelectRifleMuzzleNew), localize LSTRING(SelectRifleMuzzle), {
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotInside", "isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    // Statement
    [ACE_player, primaryWeapon ACE_player] call FUNC(selectWeaponMuzzle);
    false
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind; //Unbound (was 3 Key)

["ACE3 Weapons", QGVAR(SelectLauncherNew), localize LSTRING(SelectLauncher), {
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotInside", "isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    // Statement
    [ACE_player, secondaryWeapon ACE_player] call FUNC(selectWeaponMode);
    false
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind; //Unbound (was 4 Key)

["ACE3 Weapons", QGVAR(SelectBinocularNew), localize LSTRING(SelectBinocular), {
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotInside", "isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    // Statement
    [ACE_player, binocular ACE_player] call FUNC(selectWeaponMode);
    false
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind; //Unbound (was 5 Key)

["ACE3 Weapons", QGVAR(SelectGrenadeFrag), localize LSTRING(SelectGrenadeFrag), {
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotInside", "isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Don't change mode or show hint if advanced throwing is active
    if (ACE_player getVariable [QEGVAR(advanced_throwing,inHand), false]) exitWith {false};

    // Statement
    [ACE_player, 1] call FUNC(selectNextGrenade);
    true
},
{false},
[7, [false, false, false]], false] call CBA_fnc_addKeybind; //6 Key

["ACE3 Weapons", QGVAR(SelectGrenadeOther), localize LSTRING(SelectGrenadeOther), {
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotInside", "isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Don't change mode or show hint if advanced throwing is active
    if (ACE_player getVariable [QEGVAR(advanced_throwing,inHand), false]) exitWith {false};

    // Statement
    [ACE_player, 2] call FUNC(selectNextGrenade);
    true
},
{false},
[8, [false, false, false]], false] call CBA_fnc_addKeybind; //7 Key

["ACE3 Weapons", QGVAR(HolsterWeapon), localize LSTRING(HolsterWeapon), {
    // Conditions: canInteract
    if !([ACE_player, ACE_player, ["isNotInside", "isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {false};

    // Statement
    if ((currentWeapon ACE_player) != "") then {
        [ACE_player] call FUNC(putWeaponAway);
    } else {
        private _weapon = switch (true) do {
            case ((primaryWeapon ACE_player) != ""): {primaryWeapon ACE_player};
            case ((handgunWeapon ACE_player) != ""): {handgunWeapon ACE_player};
            case ((secondaryWeapon ACE_player) != ""): {secondaryWeapon ACE_player};
            default {""};
        };
        if (_weapon != "") then {ACE_player selectWeapon _weapon};
    };
    true
},
{false},
[11, [false, false, false]], false] call CBA_fnc_addKeybind; //0 Key

["ACE3 Vehicles", QGVAR(EngineOn), localize LSTRING(EngineOn), {
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !((ACE_player != vehicle ACE_player) && {ACE_player == driver vehicle ACE_player} && {!isEngineOn vehicle ACE_player}) exitWith {false};

    // Statement
    vehicle ACE_player engineOn true;
    true
},
{false},
[3, [false, false, false]], false] call CBA_fnc_addKeybind; //2 Key

["ACE3 Vehicles", QGVAR(EngineOff), localize LSTRING(EngineOff), {
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player && {ACE_player == driver vehicle ACE_player} && {isEngineOn vehicle ACE_player}) exitWith {false};

    // Statement
    vehicle ACE_player engineOn false;
    true
},
{false},
[2, [false, false, false]], false] call CBA_fnc_addKeybind; //1 Key

["ACE3 Vehicles", QGVAR(SelectMainGunNew), localize LSTRING(SelectMainGun), {
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 0] call FUNC(selectWeaponVehicle);
    true
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind; //Unbound (was 3 Key)

["ACE3 Vehicles", QGVAR(SelectMachineGunNew), localize LSTRING(SelectMachineGun), {
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 1] call FUNC(selectWeaponVehicle);
    true
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind; //Unbound (was 4 Key)

["ACE3 Vehicles", QGVAR(SelectMissilesNew), localize LSTRING(SelectMissiles), {
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, 2] call FUNC(selectWeaponVehicle);
    true
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind; //Unbound (was 5 Key)

["ACE3 Vehicles", QGVAR(FireSmokeLauncher), localize LSTRING(FireSmokeLauncher), {
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player != vehicle ACE_player && {ACE_player == commander vehicle ACE_player}) exitWith {false};

    // Statement
    [vehicle ACE_player] call FUNC(fireSmokeLauncher);
    true
},
{false},
[10, [false, false, false]], false] call CBA_fnc_addKeybind; //9 Key

["ACE3 Vehicles", QGVAR(CollisionLights), localize LSTRING(CollisionLights), {
    // Conditions: canInteract
    if (!([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith))) exitWith {false};
    // Conditions: specific
    if ((ACE_player isEqualTo (vehicle ACE_player)) || {ACE_player != (driver (vehicle ACE_player))}) exitWith {false};
    
    // Statement
    (vehicle ACE_player) setCollisionLight !(isCollisionLightOn (vehicle ACE_player));
    true
},
{false},
[0, [false, false, false]]] call CBA_fnc_addKeybind;

// Register fire event handler
["ace_firedPlayer", DFUNC(throwGrenade)] call CBA_fnc_addEventHandler;
