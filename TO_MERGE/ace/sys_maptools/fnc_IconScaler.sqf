//handleScale.sqf
#include "script_component.hpp"
if(!isDedicated) then {
    disableSerialization;
    _map = -1;
    waitUntil {_map = ((findDisplay 12) displayCtrl 51); !isNull _map};
    _magicW = (4.0395/0.00651044)*2;
    _magicH = (4.23508/0.00909978)*2;
    _o = 1;
    waitUntil {
        if (visibleMap && {inITEMS("ACE_Map_Tools",player)} && {!ace_common_spectator_SPECTATINGON}) then {
            if (count GVAR(RulerStartPos) == 0) then {
                _startPos = [0,0,0];
                deleteMarkerLocal QUOTE(DOUBLES(ADDON,compassRuler));
                deleteMarkerLocal QUOTE(DOUBLES(ADDON,compassRose));

                GVAR(RulerStartPos) = _startPos;

                _marker = createMarkerLocal [QUOTE(DOUBLES(ADDON,compassRuler)), [_startPos select 0, ((_startPos select 1)+(543*2))]];
                _marker setMarkerTypeLocal "FlatCompass";

                _markerRose = createMarkerLocal [QUOTE(DOUBLES(ADDON,compassRose)), [_startPos select 0, ((_startPos select 1)+(543*2))]];
                _markerRose setMarkerTypeLocal "FlatCompassRose";
                GVAR(MapPreviousDir) = 0;
            };
			_marker = QUOTE(DOUBLES(ADDON,compassRuler));
			_markerRose = QUOTE(DOUBLES(ADDON,compassRose));
			_markerType = (markerType _marker);
			if ("FlatCompass" == _markerType ||
				{"FlatCompass50" == _markerType} ||
				{"FlatCompass25" == _markerType} ||
				{"FlatCompass12" == _markerType} ||
				{"FlatCompass6" == _markerType}
			) then {
				_scale = ctrlMapScale _map;
				if(_scale <= 0.5) then {
					_marker setMarkerTypeLocal "FlatCompass";
					_markerRose setMarkerTypeLocal "FlatCompassRose";
				};
				if(_scale > 0.5) then {
					_marker setMarkerTypeLocal "FlatCompass50";
					_markerRose setMarkerTypeLocal "FlatCompassRose50";
				};
				// if(_scale > 0.7) then {
					// _marker setMarkerTypeLocal "FlatCompass25";
					// _markerRose setMarkerTypeLocal "FlatCompassRose25";
				// };
				// if(_scale > 1) then {
					// _marker setMarkerTypeLocal "FlatCompass12";
					// _markerRose setMarkerTypeLocal "FlatCompassRose12";
				// };
                _sample = _map posScreenToWorld [0.5, 0.5];
                _offset = [(_sample select 0) + 100, (_sample select 1) + 100];
                _screenOffset = _map posWorldToScreen _offset;
                _difW = abs ((_screenOffset select 0) - 0.5);
                _difH = abs ((_screenOffset select 1) - 0.5);




                _difW = _difW/(_o/_scale);
                _oScaleW = (_difW*_magicW);
                _cScaleW = (_o/_scale)*_oScaleW;
                _oScaleH = (_difH*_magicH);
                _cScaleH = (_o/_scale)*_oScaleH;
                QUOTE(DOUBLES(ADDON,compassRuler)) setMarkerSizeLocal [_cScaleW, _oScaleH];
                QUOTE(DOUBLES(ADDON,compassRose)) setMarkerSizeLocal [_cScaleW, _oScaleH];
            };
        } else {
			if (ace_common_spectator_SPECTATINGON || {!(inITEMS("ACE_Map_Tools",player))}) then {
				deleteMarkerLocal QUOTE(DOUBLES(ADDON,compassRuler));
                deleteMarkerLocal QUOTE(DOUBLES(ADDON,compassRose));
			};
            _actionId = -1;
            GVAR(MouseDown) = false;
            GVAR(DragOK)    = false;
            GVAR(OffDrag)   = false;
            GVAR(MouseShift) = false;
            GVAR(RulerKeyDown) = -1000;
            sleep 1;
        };
        false
    };
};