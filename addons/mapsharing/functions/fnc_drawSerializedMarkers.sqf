#include "script_component.hpp"

PARMAS_1(_theMap);

{
    EXPLODE_9_PVT(_x,_posCenter,_shape,_text,_dir,_colorCfg,_alpha,_type,_size,_brush);
    if (_alpha > 0) then {
        _posCenter set [0, ((_posCenter select 0) + 100)];

        EXPLODE_2_PVT(_size,_sizeX,_sizeY);

        _texture = "";
        _drawBorder = false;
        _drawColor = [];
        _markerSize = 0;
        _markerShadow = 0;

        if (_shape != "ICON") then {
            _textureConfig = configFile >> "CfgMarkerBrushes" >> _brush;
            if (!isClass _textureConfig) then {
                systemChat "Missing CfgMarkerBrushes"
            } else {
                _texture = getText (_textureConfig >> "texture");
                _drawBorder = (getNumber (_textureConfig >> "drawBorder")) > 0;
            };
            if (_texture == "") then {
                _texture = "#(argb,8,8,3)color(1,1,1,0.5)"
            };
        } else {
            _textureConfig = configFile >> "CfgMarkers" >> _type;
            if (!isClass _textureConfig) then {
                systemChat "Missing CfgMarkers"
            } else {
                _texture = getText (_textureConfig >> "icon");
                _markerSize = getNumber (_textureConfig >> "size");
                _markerShadow = getNumber (_textureConfig >> "shadow");
            };
        };

        _colorConfig = (configFile >> "CfgMarkerColors" >> _colorCfg);
        if (!isClass _colorConfig) then {
            systemChat "Missing CfgMarkerColors"
        } else {
            _drawColor = getArray (_colorConfig >> "color");
        };

        //These can be strings for some reason, great
        {
            if (typeName _x == "STRING") then {
                _drawColor set [_forEachIndex, (call compile _x)];
            };
        } forEach _drawColor;

        _drawColor set [3, ((_drawColor select 3) * _alpha)];  //Mix in alpha

        switch (_shape) do {
        case ("ELLIPSE"): {
                _theMap drawEllipse [_posCenter, _sizeX, _sizeY, _dir, _drawColor, _texture];
                if (_drawBorder) then {
                    _theMap drawEllipse [_posCenter, _sizeX, _sizeY, _dir, [1,1,1,1], ""];
                };
            };
        case ("RECTANGLE"): {
                _theMap drawRectangle [_posCenter, _sizeX, _sizeY, _dir, _drawColor, _texture];
                if (_drawBorder) then {
                    _theMap drawEllipse [_posCenter, _sizeX, _sizeY, _dir, [1,1,1,1], ""];
                };
            };
        case ("ICON"): {
                if (_markerSize > 0) then {
                    _theMap drawIcon [_texture, _drawColor, _posCenter, (_sizeX * _markerSize), (_sizeY * _markerSize), _dir, _text, _markerShadow];
                };
            };
        };
    };
} forEach GVAR(markerDataToDraw);
