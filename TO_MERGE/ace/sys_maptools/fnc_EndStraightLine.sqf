//EndStraightLine.sqf
#include "script_component.hpp"
if((format["%1", (getMarkerType QUOTE(DOUBLES(ADDON,line_origin)))]) != "") then {
    _tempName = QUOTE(DOUBLES(ADDON,temp_line));
    _name = format["%2_line_segment_%1", (count GVAR(RulerLines)), QUOTE(ADDON)];
    _newLine = [1, _name, (markerPos _tempName), ((getMarkerSize _tempName) select 1), (markerDir _tempName), (getMarkerColor _tempName)];
    _pos        = _newLine select 2;
    _length     = _newLine select 3;
    _az         = _newLine select 4;
    _color      = _newLine select 5;

    _line = createMarkerLocal [_name, _pos];
    _line setMarkerShapeLocal "RECTANGLE";
    _line setMarkerSizeLocal [0, _length];
    _line setMarkerColorLocal _color;
	_line setMarkerBrushLocal "BORDER";
    _line setMarkerDirLocal _az;

    _originMarkerName = QUOTE(DOUBLES(ADDON,line_origin));
    deleteMarkerLocal _originMarkerName;
    deleteMarkerLocal _tempName;

    GVAR(RulerLines) set[(count GVAR(RulerLines)), _newLine];
};



