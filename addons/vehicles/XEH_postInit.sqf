// by esteldunedain
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
["ACE3 Vehicles", QGVAR(speedLimiter), localize LSTRING(SpeedLimiter),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isnotinside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player == driver vehicle ACE_player &&
    {vehicle ACE_player isKindOf 'Car' ||
        {vehicle ACE_player isKindOf 'Tank'}}) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player] call FUNC(speedLimiter);
    true
},
{false},
[211, [false, false, false]], false] call cba_fnc_addKeybind; //DELETE Key
