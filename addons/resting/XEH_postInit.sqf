// by CAA-Picard
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
["ACE3",
    localize "STR_ACE_Resting_RestWeapon",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !([ACE_player] call EFUNC(common,canUseWeapon) &&
             {inputAction 'reloadMagazine' == 0} &&
             {!weaponLowered ACE_player} &&
             {speed ACE_player < 1}) exitWith {false};

        // Statement
        [ACE_player, vehicle ACE_player, currentWeapon ACE_player] call FUNC(restWeapon);
        // Return false so it doesn't block other actions
        false
    },
    [15, [false, false, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;
