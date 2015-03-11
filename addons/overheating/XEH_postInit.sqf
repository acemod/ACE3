// by CAA-Picard
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
["ACE3", QGVAR(unjamWeapon), localize "STR_ACE_Overheating_UnjamWeapon",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon) &&
    {currentWeapon ACE_player in (ACE_player getVariable [QGVAR(jammedWeapons), []])}
    ) exitWith {false};

    // Statement
    [ACE_player, currentMuzzle ACE_player, false] call FUNC(clearJam);
    true
},
{false},
[19, [true, false, false]], false] call cba_fnc_addKeybind; //R Key
