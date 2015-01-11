//EndFreehandLine.sqf
#include "script_component.hpp"
if(GVAR(LineSegment) > 0) then {
    _newLineParts = [];
    _color = "";
    for "_i" from 0 to GVAR(LineSegment)-1 do {
        _x = format["%3_freehand_%1_%2", (count GVAR(RulerLines)), _i, QUOTE(ADDON)];
        _seg = [[(markerPos _x) select 0, (markerPos _x) select 1], ((getMarkerSize _x) select 1), (markerDir _x)];
        _newLineParts set[(count _newLineParts), _seg];
        _color = (markerColor _x);
    };
    _newLine = [2, (count GVAR(RulerLines)), GVAR(LineSegment), _newLineParts, _color];
    GVAR(RulerLines) set[(count GVAR(RulerLines)), _newLine];
};


GVAR(LastLineSegment) = [];
GVAR(LineSegment) = 0;