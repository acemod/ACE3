// by esteldunedain
#include "script_component.hpp"

GVAR(pseudoRandomList) = [];
if (isServer) then {
    // Construct a list of pseudo random 2D vectors
    for "_i" from 0 to 30 do {
        GVAR(pseudoRandomList) pushBack [-1 + random 2, -1 + random 2];
    };
    publicVariable QGVAR(pseudoRandomList);
};


if !(hasInterface) exitWith {};

// Add keybinds
["ACE3 Weapons", QGVAR(unjamWeapon), localize "STR_ACE_Overheating_UnjamWeapon",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
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
