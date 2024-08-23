#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACE3 Movement", QGVAR(mount), [LLSTRING(KeybindName), LLSTRING(KeybindDescription)], "", {
    if (!dialog) then {
        [] call FUNC(getInNearest);
    };
}] call CBA_fnc_addKeybind;
