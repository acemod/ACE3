#include "\a3\editor_f\Data\Scripts\dikCodes.h"

{
    _x params ["_currentName","_key"];

     if (_currentName select [0,1] == "BI") then {
        _currentName = _currentName select [2];
    };

    private _code = (compile format [QUOTE(QUOTE(QGVAR(%1)) call FUNC(playSignal);), _currentName]);

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
