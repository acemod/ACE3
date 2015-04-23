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

private ["_mixColor", "_rowT", "_rowS", "_menuDepth", "_pathCount", "_menuInSelectedPath", "_color", "_path"];

//Mixes 2 colors (number arrays) and makes a color string "#AARRGGBB" for structured text
_mixColor = {
    PARAMS_3(_color1,_color2,_ratio);
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

GVAR(colorSelected) = [GVAR(colorTextMin), GVAR(colorTextMax), 1] call _mixColor;
GVAR(colorSelectedShadow) = [GVAR(colorShadowMin), GVAR(colorShadowMax), 1] call _mixColor;
GVAR(colorNotSelectedMatrix) = [];
GVAR(colorShadowNotSelectedMatrix) = [];

for "_pathCount" from 0 to 15 do {
    _rowT = [];
    _rowS = [];
    for "_menuDepth" from 0 to 15 do {
        if (_menuDepth > 0) then {
            _rowT pushBack ([GVAR(colorTextMin), GVAR(colorTextMax), (((_pathCount - 1) / _menuDepth) max 0.25)] call _mixColor);
            _rowS pushBack ([GVAR(colorShadowMin), GVAR(colorShadowMax), (((_pathCount - 1) / _menuDepth) max 0.25)] call _mixColor);
        } else {
            _rowT pushBack ([GVAR(colorTextMin), GVAR(colorTextMax), 0] call _mixColor);
            _rowS pushBack ([GVAR(colorShadowMin), GVAR(colorShadowMax), 0] call _mixColor);
        };
    };
    GVAR(colorNotSelectedMatrix) pushBack _rowT;
    GVAR(colorShadowNotSelectedMatrix) pushBack _rowS;
};
