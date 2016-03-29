#include "script_component.hpp"

if (!hasInterface) exitWith {};

// reload mutex, you can't play signal while reloading
GVAR(ReloadMutex) = true;

{
    _x params ["_currentName", "_key", ["_vanillaKey", ""] ];

    private _signalName = format [QGVAR(%1), _currentName];

    // Don't add "ace_gestures_" prefix to BI gestures
    if (_vanillaKey == "BI") then {
        _signalName = _currentName;
    };

    private _code = compile format [QUOTE('%1' call FUNC(playSignal)), _signalName];

    TRACE_4("Adding KeyBind",_currentName,_signalName,_code,_key);

    [
        "ACE3 Gestures",
        _currentName,
        localize format [LSTRING(%1), _currentName],
        _code,
        {false},
        [_key,  [false, (_key != -1), false]],
        false
    ] call CBA_fnc_addKeybind;

    false
} count [
    ["Freeze", 80], // Numpad 2
    ["Cover", 81], // Numpad 3
    ["Forward", 75], // Numpad 4
    ["Regroup", 76], // Numpad 5
    ["Engage", 77], // Numpad 6
    ["Point", 71], // Numpad 7
    ["Hold", 72], // Numpad 8
    ["Warning", 73], // Numpad 9
    ["Go", -1, "BI"],
    ["Advance", -1, "BI"],
    ["Follow", -1, "BI"],
    ["Up", -1, "BI"],
    ["Stop", -1, "BI"],
    ["CeaseFire", -1, "BI"]
];
