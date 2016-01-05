#include "\a3\editor_f\Data\Scripts\dikCodes.h"

{
    _x params ["_currentName","_key"];

    private _signalName = format [QGVAR(%1), _currentName];
    if (_currentName select [0,2] == "BI") then {
        //Don't add "ace_gestures_" prefix to BI gestures
        _signalName = _currentName;
    };

    private _code = (compile format [QUOTE('%1' call FUNC(playSignal);), _signalName]);

    TRACE_4("Adding KeyBind",_currentName,_signalName,_code,_key);

    [
        "ACE3 Gestures",
        _currentName,
        localize format[LSTRING(%1), _currentName],
        _code,
        {false},
        [_key,  [false, (_key != -1), false]],
        false
    ] call CBA_fnc_addKeybind;

    false
} count [
    ["stop", DIK_NUMPAD2],
    ["cover", DIK_NUMPAD3],
    ["forward", DIK_NUMPAD4],
    ["regroup", DIK_NUMPAD5],
    ["engage", DIK_NUMPAD6],
    ["point", DIK_NUMPAD7],
    ["hold", DIK_NUMPAD8],
    ["warning", DIK_NUMPAD9],
    ["BIgestureGo", -1],
    ["BIgestureAdvance", -1],
    ["BIgestureFollow", -1],
    ["BIgestureUp", -1],
    ["BIgestureFreeze", -1],
    ["BIgestureCeaseFire", -1]
];
