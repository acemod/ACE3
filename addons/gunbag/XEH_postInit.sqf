#include "script_component.hpp"

["ACE3 Equipment", QGVAR(switchWeapon), localize LSTRING(switchWeapon),
{
    if !([ACE_player, ACE_player, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if ([ACE_player, ACE_player] call FUNC(canInteract) != -1) exitWith {};
    [ACE_player, ACE_player] call FUNC(switchWeapon);
    false
},
{
    if (CBA_missionTime - GVAR(lastOpenedOn) > 0.5) exitWith {
        [objNull] call FUNC(openMenu);
    };
    false
},
[35, [false, false, false]], false, 0] call CBA_fnc_addKeybind;
