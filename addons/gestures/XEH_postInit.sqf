#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Add keybinds
{
    _x params ["_currentName", "_key", ["_vanillaKey", false] ];

    // Don't add "ace_gestures_" prefix to BI gestures
    private _signalName = if (_vanillaKey) then {
        format ["BIgesture%1", _currentName];
    } else {
        format [QGVAR(%1), _currentName];
    };

    private _code = compile format [QUOTE('%1' call FUNC(playSignal)), _signalName];
    if (_currentName == "Stop") then {
        _code = compile format [QUOTE('%1' call FUNC(playSignal)), "BIgestureFreeze"];
    };

    TRACE_4("Adding KeyBind",_currentName,_signalName,_code,_key);

    ["ACE3 Gestures", localize LSTRING(ACEKeybindCategoryGestures)] call CBA_fnc_registerKeybindModPrettyName;

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
    ["Go", -1, true],
    ["Advance", -1, true],
    ["Follow", -1, true],
    ["Up", -1, true],
    ["Stop", -1, true],
    ["CeaseFire", -1, true]
];
