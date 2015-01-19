// by CAA-Picard
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
["ACE3",
    localize "STR_ACE_Reload_checkAmmo",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if !([ACE_player] call EFUNC(common,canUseWeapon) ||
             {(vehicle ACE_player) isKindOf 'StaticWeapon'}) exitWith {false};

        // Statement
        [ACE_player, vehicle ACE_player, false] call FUNC(checkAmmo);
        true
    },
    [19, [false, true, false]],
    false,
    "keydown"
] call cba_fnc_registerKeybind;
