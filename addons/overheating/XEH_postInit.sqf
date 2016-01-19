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

GVAR(weaponInfoCache) = createLocation ["NameVillage", [-10000,-10000,-10000], 0, 0];
GVAR(weaponInfoCache) setText QGVAR(weaponInfoCache);

// Add keybinds
["ACE3 Weapons", QGVAR(unjamWeapon), localize LSTRING(UnjamWeapon),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon) &&
    {currentWeapon ACE_player in (ACE_player getVariable [QGVAR(jammedWeapons), []])}
    ) exitWith {false};

    // Statement
    [ACE_player, currentMuzzle ACE_player, false] call FUNC(clearJam);
    true
},
{false},
[19, [true, false, false]], false] call CBA_fnc_addKeybind; //SHIFT + R Key


// Create a PFH to cool down all player weapons at (infrequent) regular intervals
[{
    if (primaryWeapon ACE_player != "") then {
        [ACE_player, primaryWeapon ACE_player, 0] call FUNC(updateTemperature);
    };
    if (handgunWeapon ACE_player != "") then {
        [ACE_player, handgunWeapon ACE_player, 0] call FUNC(updateTemperature);
    };
    if (secondaryWeapon ACE_player != "") then {
        [ACE_player, secondaryWeapon ACE_player, 0] call FUNC(updateTemperature);
    };
}, 5, []] call CBA_fnc_addPerFrameHandler;
