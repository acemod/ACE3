// by esteldunedain
#include "script_component.hpp"

if (isServer) then {
    GVAR(pseudoRandomList) = [];
    // Construct a list of pseudo random 2D vectors
    for "_i" from 0 to 30 do {
        GVAR(pseudoRandomList) pushBack [-1 + random 2, -1 + random 2];
    };
    publicVariable QGVAR(pseudoRandomList);
};


if !(hasInterface) exitWith {};

GVAR(cacheWeaponData) = call CBA_fnc_createNamespace;
GVAR(cacheAmmoData) = call CBA_fnc_createNamespace;
GVAR(cacheSilencerData) = call CBA_fnc_createNamespace;

// Add keybinds
["ACE3 Weapons", QGVAR(unjamWeapon), localize LSTRING(UnjamWeapon),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific

    if !([ACE_player] call FUNC(canUnjam)) exitWith {false};

    // Statement
    [ACE_player, currentMuzzle ACE_player, false] call FUNC(clearJam);
    true
},
{false},
[19, [true, false, false]], false] call CBA_fnc_addKeybind; //SHIFT + R Key


// Schedule cool down calculation of player weapons at (infrequent) regular intervals
[] call FUNC(updateTemperatureThread);

["SettingsInitialized", {
    // Register fire event handler
    ["firedPlayer", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    // Only add eh to non local players if dispersion is enabled
    if (GVAR(overheatingDispersion)) then {
        ["firedPlayerNonLocal", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    };
}] call EFUNC(common,addEventHandler);
