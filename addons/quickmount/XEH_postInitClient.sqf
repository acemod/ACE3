#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACE3 Movement", QGVAR(mount), [localize LSTRING(KeybindName), localize LSTRING(KeybindDescription)], "", {
    if (!dialog) then {
        call FUNC(getInNearest);
    };
    false
}] call CBA_fnc_addKeybind;
