// by esteldunedain
#include "script_component.hpp"

if (!hasInterface) exitWith {};

// IGNORE_PRIVATE_WARNING(_player)
//["Soldier", {_player = ACE_player; if (currentWeapon _player in (_player getVariable [QGVAR(safedWeapons), []])) then {[false] call FUNC(setSafeModeVisual)}] call EFUNC(common,addInfoDisplayEventHandler);
//@todo addEventHandler infoDisplayChanged with select 1 == "Soldier"

// add keybinds
["ACE3 Weapons", QGVAR(safeMode), localize LSTRING(SafeMode),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon && {currentWeapon ACE_player != binocular ACE_player} && {currentWeapon ACE_player != ""}) exitWith {false};

    // Statement
    [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call FUNC(lockSafety);
    true
},
{false},
[41, [false, true, false]], false] call CBA_fnc_addKeybind;
