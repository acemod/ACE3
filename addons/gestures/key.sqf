#include "\a3\editor_f\Data\Scripts\dikCodes.h"

{
    _x params ["_currentName","_key"];

    private _signalName = format [QGVAR(%1), _currentName];

    //Don't add "ace_gestures_" prefix to BI gestures
    if (_key == -1) then {
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
    ["Freeze", DIK_NUMPAD2],
    ["Cover", DIK_NUMPAD3],
    ["Forward", DIK_NUMPAD4],
    ["Regroup", DIK_NUMPAD5],
    ["Engage", DIK_NUMPAD6],
    ["Point", DIK_NUMPAD7],
    ["Hold", DIK_NUMPAD8],
    ["Warning", DIK_NUMPAD9],
    ["Go", -1],
    ["Advance", -1],
    ["Follow", -1],
    ["Up", -1],
    ["Stop", -1],
    ["CeaseFire", -1]
];
