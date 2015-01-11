#include "script_component.hpp"

_target = _this select 0;
_x = _this select 1;
if(_target == player) then {
    switch((typeName _x)) do {
        case "ARRAY": {
            switch (_x select 0) do {
                case 1: {
                    _pos        = _x select 2;
                    _length     = _x select 3;
                    _az         = _x select 4;
                    _color      = _x select 5;
                    _markerName = format["%2_line_segment_%1", (count GVAR(RulerLines)), QUOTE(ADDON)];
                    _lineName = createMarkerLocal [_markerName, _pos];
                    _lineName setMarkerShapeLocal "RECTANGLE";
                    _lineName setMarkerSizeLocal [0, _length];
                    _lineName setMarkerColorLocal _color;
					_lineName setMarkerBrushLocal "BORDER";
                    _lineName setMarkerDirLocal _az;
                    GVAR(RulerLines) set[(count GVAR(RulerLines)), _line];
                };
                case 2: {
                    _line = _x;
                    _lineCount = _line select 2;
                    if(!(isNil "_lineCount")) then {
                        for "_i" from 0 to _lineCount-1 do {
                            _markerName = format["%3_freehand_%1_%2", (count GVAR(RulerLines)), _i, QUOTE(ADDON)];
                            _pos        = ((_x select 3) select _i) select 0;
                            _length     = ((_x select 3) select _i) select 1;
                            _az         = ((_x select 3) select _i) select 2;
                            _color      = _x select 4;
                            _lineName = createMarkerLocal [_markerName, _pos];
                            _lineName setMarkerShapeLocal "RECTANGLE";
                            _lineName setMarkerSizeLocal [0, _length];
                            _lineName setMarkerColorLocal _color;
							_lineName setMarkerBrushLocal "BORDER";
                            _lineName setMarkerDirLocal _az;
                        };
                        GVAR(RulerLines) set[(count GVAR(RulerLines)), _line];
                    };
                };
            };
            hintSilent format[localize "STR_ACE_MAPTOOLS_COPYSTAT", GVAR(CopyNumber), GVAR(CopyTotal)];
            GVAR(CopyNumber) = GVAR(CopyNumber) + 1;
        };
        case "SCALAR": {
            GVAR(CopyTotal) = _x;
        };
        case "BOOL": {
            if(_x) then {
                hintSilent localize "STR_ACE_MAPTOOLS_COPYSUC";
            } else {
                hintSilent localize "STR_ACE_MAPTOOLS_COPYFAIL";
            };
            GVAR(CopyTotal) = 0;
            GVAR(CopyNumber) = 0;
        };
    };
};