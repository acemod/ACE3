//FreeHandLine.sqf
#include "script_component.hpp"
disableSerialization;

_pos            = [_this select 1, _this select 2];
_mPos           = ((findDisplay 12) displayCtrl 51) posScreenToWorld _pos;
if((count GVAR(LastLineSegment)) < 2) then {
    GVAR(LastLineSegment) = _mPos;
};
_lastPos        = GVAR(LastLineSegment);
if((count _lastPos) > 0 && GVAR(RulerKeyDown) == (["CBA","events","ace_sys_maptools","Start_Drawing","key"] call ace_settings_fnc_getNumber)) then {
    _length = _mPos distance _lastPos;
    _map = -1;
    waitUntil{_map = ((findDisplay 12) displayCtrl 51); !isNull _map};
    _scale = ctrlMapScale _map;
    _minLength = ((_scale*20) max 2);
    if(_length > _minLength) then {
        _x1 = _lastPos select 0;
        _x2 = _mPos select 0;
        _y1 = _lastPos select 1;
        _y2 = _mPos select 1;
        _az = (180 + (((_x1 - _x2) atan2 (_y1 - _y2))) mod 360);
        _segmentX = (_lastPos select 0) + sin(_az)*(_length/2);
        _segmentY = (_lastPos select 1) + cos(_az)*(_length/2);
        _name = format["%3_freehand_%1_%2", (count GVAR(RulerLines)), GVAR(LineSegment), QUOTE(ADDON)];
        GVAR(LineSegment) = GVAR(LineSegment) + 1;
        _segment = createMarkerLocal [_name, [_segmentX, _segmentY, 0]];
        _segment setMarkerShapeLocal "RECTANGLE";
        _segment setMarkerSizeLocal [0, (_length/2)];
        _segment setMarkerDirLocal _az;
        _segment setMarkerColorLocal (GVAR(LineColors) select GVAR(MapLineColor));
		_segment setMarkerBrushLocal "BORDER";
        GVAR(LastLineSegment) = _mPos;
    };
};