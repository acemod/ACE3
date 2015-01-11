//handleDrag.sqf
#include "script_component.hpp"
if(inITEMS("ACE_Map_Tools",player)) then {
    if(GVAR(MouseDown)) then {
         _pos            = [_this select 1, _this select 2];
        _mPos           = ((findDisplay 12) displayCtrl 51) posScreenToWorld _pos;
        if(GVAR(RulerKeyDown) == -1000 || {GVAR(RulerKeyDown) == 42}) then {
            _marker = QUOTE(DOUBLES(ADDON,compassRuler));
			_markerType = (markerType _marker);
		if("FlatCompass" == _markerType ||
			{"FlatCompass50" == _markerType} ||
			{"FlatCompass25" == _markerType} ||
			{"FlatCompass12" == _markerType} ||
			{"FlatCompass6" == _markerType}
		) then {
                if(!GVAR(OffDrag)) then {
                    _overCompass    = false;
                    _startPos 		= GVAR(RulerStartPos);
                    _prevDir        = GVAR(MapPreviousDir);
                    _offSet         = 543*2;
                    _sliceStartX    = (_startPos select 0) + sin(_prevDir)*_offSet;
                    _sliceStartY    = (_startPos select 1) + cos(_prevDir)*_offSet;
                    _size           = [755*2, 1460*2];

                    if(!GVAR(DragOK)) then {
                        _overCompass    = [[_sliceStartX, _sliceStartY], _mPos, _size, _prevDir] call FUNC(OverObject);
                    };
                    if(_overCompass || {GVAR(DragOK)}) then {
                        GVAR(DragOK) = true;
                        if(GVAR(MouseShift)) then {
                            _x1 = _startPos select 0;
                            _x2 = _mPos select 0;
                            _y1 = _startPos select 1;
                            _y2 = _mPos select 1;
                            _az = (180 + (((_x1 - _x2) atan2 (_y1 - _y2))) mod 360);
                            if(GVAR(LastDragAzimuth) == -1000) then {
                                GVAR(LastDragAzimuth) = _az;
                            };
                            _azDif = _az - GVAR(LastDragAzimuth);
                            GVAR(LastDragAzimuth) = _az;
                            _az = _prevDir + _azDif;
                            _sliceStartX = (_startPos select 0) + sin(_az)*_offSet;
                            _sliceStartY = (_startPos select 1) + cos(_az)*_offSet;
                            QUOTE(DOUBLES(ADDON,compassRuler)) setMarkerDirLocal _az;
                            QUOTE(DOUBLES(ADDON,compassRuler)) setMarkerPosLocal [_sliceStartX, _sliceStartY];
                            GVAR(MapPreviousDir) = _az;
                        } else {
                            if((count GVAR(LastDragPosition)) < 1) then {
                                GVAR(LastDragPosition) = _mPos;
                            };
                            _difX = (_mPos select 0) - (GVAR(LastDragPosition) select 0);
                            _difY = (_mPos select 1) - (GVAR(LastDragPosition) select 1);
                            _compassPos = markerPos QUOTE(DOUBLES(ADDON,compassRose));
                            _rulerPos = markerPos QUOTE(DOUBLES(ADDON,compassRuler));
                            QUOTE(DOUBLES(ADDON,compassRose)) setMarkerPosLocal [(_compassPos select 0) + _difX, (_compassPos select 1) + _difY];
                            QUOTE(DOUBLES(ADDON,compassRuler)) setMarkerPosLocal [(_rulerPos select 0) + _difX, (_rulerPos select 1) + _difY];
                            GVAR(RulerStartPos) = [(_startPos select 0) + _difX, (_startPos select 1) + _difY];
                        };
                    } else {
                        GVAR(OffDrag) = true;
                    };
                };
            };
        } else {
            switch(GVAR(RulerKeyDown)) do {
                case (["CBA","events","ace_sys_maptools","Start_Drawing","key"] call ace_settings_fnc_getNumber): {
                    if(GVAR(DragAction) == "" || {GVAR(DragAction) == QGVAR(FreeHandLine)}) then {
                        GVAR(DragAction) = QGVAR(FreeHandLine);
                        _this call FUNC(FreeHandLine);
                        GVAR(UpHandlerFnc) = FUNC(EndFreehandLine);
                    };

                };
                case (["CBA","events","ace_sys_maptools","End_Straight_Line","key"] call ace_settings_fnc_getNumber): {
                    if(GVAR(DragAction) == "" || {GVAR(DragAction) == QGVAR(StraightLine)}) then {
                        GVAR(DragAction) = QGVAR(StraightLine);
                        _this call FUNC(StraightLine);
                        GVAR(UpHandlerFnc) = FUNC(EndStraightLine);
                    };
                };
                default {};
            };
        };
        GVAR(LastDragPosition) = _mPos;
    };
};