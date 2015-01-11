//DeSelectLine.sqf
#include "script_component.hpp"
switch (GVAR(SelectedType)) do {
    case 1: {
        _line = GVAR(RulerLines) select GVAR(SelectedLine);
		(_line select 1) setMarkerSizeLocal [0, (getMarkerSize (_line select 1)) select 1];
    };

    case 2: {
        _line = GVAR(RulerLines) select GVAR(SelectedLine);
        _lineCount = _line select 2;
        if(!(isNil "_lineCount")) then {
            for "_x" from 0 to _lineCount do {
                _marker = format["%3_freehand_%1_%2", GVAR(SelectedLine), _x, QUOTE(ADDON)];
				_marker setMarkerSizeLocal [0, (getMarkerSize _marker) select 1];
            };
        };
    };
    default {};
};