#include "script_component.hpp"

[
    "ACE3 Radar",
    QGVAR(switchRadar),
    [localize LSTRING(switchRadar), localize LSTRING(switchRadar_description)],
    { call FUNC(switchRadar) },
    { false },
    [0x24, [false, false, false]]
] call CBA_fnc_addKeybind;

// - Width --------------------------------------------------------------------
[
    "ACE3 Radar",
    QGVAR(increaseWidth),
    [localize LSTRING(increaseWidth), localize LSTRING(increaseWidth_description)],
    { [true, true] call FUNC(changeCone) },
    { false },
    [0x25, [false, false, false]],
    true
] call CBA_fnc_addKeybind;
[
    "ACE3 Radar",
    QGVAR(decreaseWidth),
    [localize LSTRING(decreaseWidth), localize LSTRING(decreaseWidth_description)],
    { [false, true] call FUNC(changeCone) },
    { false },
    [0x25, [true, false, false]],
    true
] call CBA_fnc_addKeybind;

// - Height -------------------------------------------------------------------
[
    "ACE3 Radar",
    QGVAR(increaseHeight),
    [localize LSTRING(increaseHeight), localize LSTRING(increaseHeight_description)],
    { [true, false] call FUNC(changeCone) },
    { false },
    [0x26, [false, false, false]],
    true
] call CBA_fnc_addKeybind;
[
    "ACE3 Radar",
    QGVAR(decreaseHeight),
    [localize LSTRING(decreaseHeight), localize LSTRING(decreaseHeight_description)],
    { [false, false] call FUNC(changeCone) },
    { false },
    [0x26, [true, false, false]],
    true
] call CBA_fnc_addKeybind;
