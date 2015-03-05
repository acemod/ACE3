// by CAA-Picard
#include "script_component.hpp"

//["Soldier", {_player = ACE_player; if (currentWeapon _player in (_player getVariable [QGVAR(safedWeapons), []])) then {[false] call FUNC(setSafeModeVisual)}] call EFUNC(common,addInfoDisplayEventHandler);
//@todo addEventHandler infoDisplayChanged with select 1 == "Soldier"


// Add keybinds
["ACE3", QGVAR(safeMode), localize "STR_ACE_SafeMode_SafeMode",
{
    // Conditions: canInteract
    _exceptions = [QEGVAR(interaction,isNotEscorting)];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call FUNC(lockSafety);
    true
},
{false},
[41, [false, true, false]], false] call cba_fnc_addKeybind;
