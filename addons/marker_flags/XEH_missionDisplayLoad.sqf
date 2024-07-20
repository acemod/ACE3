#include "script_component.hpp"

if (!hasInterface) exitWith {};

params ["_display"];

_display displayAddEventHandler ["MouseZChanged", {
    params ["", "_scroll"];
    [_scroll] call FUNC(handleScrollWheel);
}];

_display displayAddEventHandler ["MouseButtonDown", {
    params ["", "_button"];
    if (GVAR(isPlacing) isNotEqualTo PLACE_WAITING) exitWith {false};
    if (_button isNotEqualTo 1) exitWith {false}; // 1 = Left mouse button
    GVAR(isPlacing) = PLACE_CANCEL;
}];
