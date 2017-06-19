/*
 * Author: PabstMirror
 * Builds color strings needed for displaying interaction text
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_interact_menu_fnc_setupTextColor
 *
 * Public: No
 */
#include "script_component.hpp"

//Mixes 2 colors (number arrays) and makes a color string "#AARRGGBB" for structured text
private _mixColor = {
    params ["_color1", "_color2", "_ratio"];

    private _return = "";
    for "_index" from 0 to 3 do {
        private _mix = linearConversion [0, 1, _ratio, (_color1 select _index), (_color2 select _index)];
        if (_index != 3) then {
            _return = _return + ([255 * _mix] call EFUNC(common,toHex));
        } else {
            _return = "#" + ([255 * _mix] call EFUNC(common,toHex)) + _return;
        };
    };
    _return
};

private _colorTextMin = missionNamespace getVariable [QGVAR(colorTextMin), [1,1,1,0.25]];
private _colorTextMax = missionNamespace getVariable [QGVAR(colorTextMax), [1,1,1,1]];
private _colorShadowMin = missionNamespace getVariable [QGVAR(colorShadowMin), [0,0,0,0.25]];
private _colorShadowMax = missionNamespace getVariable [QGVAR(colorShadowMax), [0,0,0,1]];
private _shadowSetting = missionNamespace getVariable [QGVAR(shadowSetting), 2];
private _textSize = missionNamespace getVariable [QGVAR(textSize), 2];

TRACE_6("Building text matrix",_colorTextMin,_colorTextMax,_colorShadowMin,_colorShadowMax,_shadowSetting,_textSize);

private _textColor = [_colorTextMin, _colorTextMax, 1] call _mixColor;
private _shadowColor = [_colorShadowMin, _colorShadowMax, 1] call _mixColor;
_textSize = switch (_textSize) do {
    case (0): {0.4};
    case (1): {0.6};
    case (2): {0.8};
    case (3): {1};
    case (4): {1.2};
};

GVAR(colorSelectedSettings) = format ["color='%1' size='%2' shadow='%3' shadowColor='%4' shadowOffset='0.06'", _textColor, _textSize, _shadowSetting, _shadowColor];

GVAR(textSettingsMatrix) = [];
for "_pathCount" from 0 to 15 do {
    private _row = [];
    for "_menuDepth" from 0 to 15 do {
        if (_menuDepth > 0) then {
            _textColor = [_colorTextMin, _colorTextMax, (((_pathCount - 1) / _menuDepth) max 0.25)] call _mixColor;
            _shadowColor = [_colorShadowMin, _colorShadowMax, (((_pathCount - 1) / _menuDepth) max 0.25)] call _mixColor;
        } else {
            _textColor = [_colorTextMin, _colorTextMax, 0] call _mixColor;
            _shadowColor = [_colorShadowMin, _colorShadowMax, 0] call _mixColor;
        };
        _row pushBack format ["color='%1' size='%2' shadow='%3' shadowColor='%4' shadowOffset='0.06'", _textColor, _textSize, _shadowSetting, _shadowColor];
    };
    GVAR(textSettingsMatrix) pushBack _row;
};
