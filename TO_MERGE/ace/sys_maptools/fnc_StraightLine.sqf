//StraightLine.sqf
#include "script_component.hpp"
_pos            = [_this select 1, _this select 2];
_mPos           = ((findDisplay 12) displayCtrl 51) posScreenToWorld _pos;
_lastPos        = (markerPos QUOTE(DOUBLES(ADDON,line_origin)));

if((format["%1", (getMarkerType QUOTE(DOUBLES(ADDON,line_origin)))]) != "") then {

    _length = _mPos distance _lastPos;
    if(_length > 2) then {
        _x1 = _lastPos select 0;
        _x2 = _mPos select 0;
        _y1 = _lastPos select 1;
        _y2 = _mPos select 1;
        _az = (180 + (((_x1 - _x2) atan2 (_y1 - _y2))) mod 360);
        _segmentX = (_lastPos select 0) + sin(_az)*(_length/2);
        _segmentY = (_lastPos select 1) + cos(_az)*(_length/2);

        _name = QUOTE(DOUBLES(ADDON,temp_line));
        deleteMarker _name;
        _segment = createMarkerLocal [_name, [_segmentX, _segmentY, 0]];
        _segment setMarkerShapeLocal "RECTANGLE";
        _segment setMarkerSizeLocal [0, (_length/2)];
        _segment setMarkerDirLocal _az;
        _segment setMarkerColorLocal (GVAR(LineColors) select GVAR(MapLineColor));
		_segment setMarkerBrushLocal "BORDER";
    };
};