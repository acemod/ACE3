/*
 * Author: PabstMirror
 * Builds color strings needed for displaying interaction text
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_menuDepth", "_mixColor", "_pathCount", "_row", "_shadowColor", "_textColor", "_textSize", "_colorShadowMax", "_colorShadowMin", "_colorTextMax", "_colorTextMin", "_shadowSetting"];

//Mixes 2 colors (number arrays) and makes a color string "#AARRGGBB" for structured text
_mixColor = {
    params ["_color1", "_color2", "_ratio"];
    private ["_return", "_mix", "_index"];
    _return = "";
    for "_index" from 0 to 3 do {
        _mix = linearConversion [0, 1, _ratio, (_color1 select _index), (_color2 select _index)];
        if (_index != 3) then {
            _return = _return + ([255 * _mix] call EFUNC(common,toHex));
        } else {
            _return = "#" + ([255 * _mix] call EFUNC(common,toHex)) + _return;
        };
    };
    _return
};

_colorTextMin = missionNamespace getVariable [QGVAR(colorTextMin), [1,1,1,0.25]];
_colorTextMax = missionNamespace getVariable [QGVAR(colorTextMax), [1,1,1,1]];
_colorShadowMin = missionNamespace getVariable [QGVAR(colorShadowMin), [0,0,0,0.25]];
_colorShadowMax = missionNamespace getVariable [QGVAR(colorShadowMax), [0,0,0,1]];
_shadowSetting = missionNamespace getVariable [QGVAR(shadowSetting), 2];
_textSize = missionNamespace getVariable [QGVAR(textSize), 2];

_textColor = [_colorTextMin, _colorTextMax, 1] call _mixColor;
_shadowColor = [_colorShadowMin, _colorShadowMax, 1] call _mixColor;
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
    _row = [];
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
