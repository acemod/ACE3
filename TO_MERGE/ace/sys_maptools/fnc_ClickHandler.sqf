/////////////////////////////////////////////////////
// ruler.sqf
// by nou
//
// please see the documentation in add_ruler.sqf
//
// There is a lot of things that should be documented in here
// but I do not have the time right now. It is pretty easy to
// follow though. I hope! ;)
/////////////////////////////////////////////////////
#include "script_component.hpp"
if	(inITEMS("ACE_Map_Tools",player)) then {
    disableSerialization;
    _params     = _this select 0;

    _ctrlId 	= _params select 0;
    _mouseBtnId	= _params select 1;
    _scrX		= _params select 2;
    _scrY		= _params select 3;
    _shiftBtn	= _params select 4;
    _ctrlBtn	= _params select 5;
    _altBtn		= _params select 6;

    _colors     = GVAR(LineColors);

    _pos		= _ctrlId ctrlMapScreenToWorld [_scrX, _scrY];
    _offSet     = 543*2;


    if(GVAR(RulerKeyDown) != -1000) then {
        switch(GVAR(RulerKeyDown)) do {
            case (["CBA","events","ace_sys_maptools","Place_Ruler","key"] call ace_settings_fnc_getNumber): {
                _startPos = _pos;
                deleteMarkerLocal QUOTE(DOUBLES(ADDON,compassRuler));
                deleteMarkerLocal QUOTE(DOUBLES(ADDON,compassRose));

                GVAR(RulerStartPos) = _pos;

                _marker = createMarkerLocal [QUOTE(DOUBLES(ADDON,compassRuler)), [_startPos select 0, ((_startPos select 1)+_offSet)]];
                _marker setMarkerTypeLocal "FlatCompass";

                _markerRose = createMarkerLocal [QUOTE(DOUBLES(ADDON,compassRose)), [_startPos select 0, ((_startPos select 1)+(_offSet))]];
                _markerRose setMarkerTypeLocal "FlatCompassRose";
                GVAR(MapPreviousDir) = 0;
            };
            case (["CBA","events","ace_sys_maptools","Align_Ruler","key"] call ace_settings_fnc_getNumber): {
                deleteMarkerLocal QUOTE(DOUBLES(ADDON,compassRuler));
                deleteMarkerLocal QUOTE(DOUBLES(ADDON,compassRose));
                _startPos = GVAR(RulerStartPos);

                _marker = createMarkerLocal [QUOTE(DOUBLES(ADDON,compassRuler)), [_startPos select 0, ((_startPos select 1)+_offSet)]];
                _marker setMarkerTypeLocal "FlatCompass";

                _markerRose = createMarkerLocal [QUOTE(DOUBLES(ADDON,compassRose)), [_startPos select 0, ((_startPos select 1)+(_offSet))]];
                _markerRose setMarkerTypeLocal "FlatCompassRose";

                _endPos = _pos;
                _x1 = _startPos select 0;
                _x2 = _endPos select 0;
                _y1 = _startPos select 1;
                _y2 = _endPos select 1;
                _az = (180 + (((_x1 - _x2) atan2 (_y1 - _y2))) mod 360);

                _sliceStartX = (_startPos select 0) + sin(_az)*_offSet;
                _sliceStartY = (_startPos select 1) + cos(_az)*_offSet;
                _marker setMarkerDirLocal _az;
                _marker setMarkerPosLocal [_sliceStartX, _sliceStartY];
                GVAR(MapPreviousDir) = _az;
            };


            case (["CBA","events","ace_sys_maptools","Start_Drawing","key"] call ace_settings_fnc_getNumber): {
                if(!GVAR(MouseDown)) then {
                    if((GVAR(MapLineSegmentStart) select 0) == (_pos select 0) && {(GVAR(MapLineSegmentStart) select 1) == (GVAR(MapLineSegmentStart) select 1)}) then {
                        GVAR(MapLineColor) = GVAR(MapLineColor) + 1;
                        if(GVAR(MapLineColor) > (count _colors)-1) then {
                            GVAR(MapLineColor) = 0;
                        };
                    };
                    _color = _colors select GVAR(MapLineColor);
                    GVAR(MapLineSegmentStart) = _pos;
                    _originMarkerName = QUOTE(DOUBLES(ADDON,line_origin));
                    deleteMarkerLocal _originMarkerName;
                    _origin = createMarkerLocal [_originMarkerName, _pos];
                    _origin setMarkerShapeLocal "ICON";
                    _origin setMarkerTypeLocal "mil_dot";
                    _origin setMarkerTextLocal "";
                    _origin setMarkerColorLocal _color;
                };
            };

            case (["CBA","events","ace_sys_maptools","End_Straight_Line","key"] call ace_settings_fnc_getNumber): {
                if(!GVAR(MouseDown) && {((format["%1", (getMarkerType QUOTE(DOUBLES(ADDON,line_origin)))]) != "")}) then {
                    _ctrl = ((findDisplay 12) displayCtrl 51);
                    _endPos = _pos;
                    _x1 = GVAR(MapLineSegmentStart) select 0;
                    _x2 = _endPos select 0;
                    _y1 = GVAR(MapLineSegmentStart) select 1;
                    _y2 = _endPos select 1;
                    _az = (180 + (((_x1 - _x2) atan2 (_y1 - _y2))) mod 360);
                    _distance = [_x1, _y1, 0] distance [_x2, _y2, 0];
                    _posX = (GVAR(MapLineSegmentStart) select 0) + sin(_az)*(_distance/2);
                    _posY = (GVAR(MapLineSegmentStart) select 1) + cos(_az)*(_distance/2);

                    _originMarkerName = QUOTE(DOUBLES(ADDON,line_origin));

                    deleteMarkerLocal _originMarkerName;
                    _name = format["%2_line_segment_%1", (count GVAR(RulerLines)), QUOTE(ADDON)];
                    _color = _colors select GVAR(MapLineColor);
                    _line = createMarkerLocal [_name, [_posX, _posY, 0]];
                    _line setMarkerShapeLocal "RECTANGLE";
                    _line setMarkerSizeLocal [0, (_distance/2)];
					_line setMarkerBrushLocal "BORDER";
                    _line setMarkerColorLocal _color;
                    _line setMarkerDirLocal _az;
                    _newLine = [1, _name, [_posX, _posY, 0], (_distance/2), _az, _color];
                    GVAR(RulerLines) set[(count GVAR(RulerLines)), _newLine];
                };
            };
        };
    } else {
        _selected = false;
        for "_i" from 0 to (count GVAR(RulerLines))-1 do {
            _x = (GVAR(RulerLines) select _i);
            if(!(isNil "_x")) then {
                if((count _x) > 2) then {
                    switch (_x select 0) do {
                        case 1: {
                            _overLine = [_x select 2, _pos, (getMarkerSize (_x select 1)), _x select 4] call FUNC(OverObject);
                            if(_overLine) exitWith {
                                [] call FUNC(DeSelectLine);
                                GVAR(SelectedLine) = _i;
                                GVAR(SelectedType) = 1;
                                [] call FUNC(SelectLine);
                                _selected = true;
                            };
                        };
                        case 2: {
                            _lineCount = _x select 2;
                            if(!(isNil "_lineCount")) then {
                                for "_c" from 0 to _lineCount-1 do {
                                    _marker = format["%3_freehand_%1_%2", _i, _c, QUOTE(ADDON)];
                                    _overLine = [(getMarkerPos _marker), _pos, (getMarkerSize _marker), (markerDir _marker)] call FUNC(OverObject);
                                    if(_overLine) exitWith {
                                        [] call FUNC(DeSelectLine);
                                        GVAR(SelectedLine) = _i;
                                        GVAR(SelectedType) = 2;
                                        [] call FUNC(SelectLine);
                                        _selected = true;
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if(_selected) exitWith {};
        };
        if(!_selected) then {
            [] call FUNC(DeSelectLine);
        };
    };

};