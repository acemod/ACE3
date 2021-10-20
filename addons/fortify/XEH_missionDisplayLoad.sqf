#include "script_component.hpp"

if (!hasInterface) exitWith {};

params ["_display"];

_display displayAddEventHandler ["MouseZChanged", {
    (_this select 1) call FUNC(handleScrollWheel);
}];

_display displayAddEventHandler ["MouseButtonDown", {
    if (GVAR(isPlacing) != PLACE_WAITING) exitWith {false};
    if ((_this select 1) != 1) exitWith {false};
    GVAR(isPlacing) = PLACE_CANCEL
}];
