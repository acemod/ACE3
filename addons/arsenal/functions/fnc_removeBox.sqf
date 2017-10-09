#include "script_component.hpp"
#include "..\defines.hpp"

params ["_object", "_global"];

if (_global) then {
    //[""] call CBA_fnc_removeGlobalEventJIP;
    [QGVAR(removeBox), [_object, false]] call CBA_fnc_globalEvent;
} else {
    [_object, 0, ["ACE_MainActions", QGVAR(interaction)]] call EFUNC(interact_menu,removeActionFromObject);
};