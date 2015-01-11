//DeleteLine.sqf
#include "script_component.hpp"
switch (GVAR(SelectedType)) do {
    case 1: {
        _line = GVAR(RulerLines) select GVAR(SelectedLine);
        deleteMarkerLocal (_line select 1);
        GVAR(RulerLines) set [GVAR(SelectedLine), nil];
        GVAR(SelectedLine) = "";
        GVAR(SelectedType) = -1;
    };
    case 2: {
        _lineCount = ((GVAR(RulerLines) select GVAR(SelectedLine)) select 2);
        if(!(isNil "_lineCount")) then {
            for "_x" from 0 to _lineCount do {
                _marker = format["%3_freehand_%1_%2", GVAR(SelectedLine), _x, QUOTE(ADDON)];
                deleteMarkerLocal _marker;
            };
        };
        GVAR(RulerLines) set [GVAR(SelectedLine), nil];
        GVAR(SelectedLine) = "";
        GVAR(SelectedType) = -1;
    };
    default {};
};