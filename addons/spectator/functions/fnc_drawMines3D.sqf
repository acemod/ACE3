/*
    Author:
    voiper
    
    Description:
    Draw mines in 3D.

    Arguments:
    None

    Example:
    call ace_spectator_fnc_drawMines3D;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

#define SCALE safeZoneH / 100
#define TEXTMAX (1.5 * SCALE)
#define TEXTMIN 6 * SCALE
#define ICONMAX (30 * SCALE)
#define ICONMIN (120 * SCALE)
#define TEXTURE "\A3\ui_f\data\map\markers\military\triangle_CA.paa"

_cam = GVAR(cam);
_showText = (GVAR(markers) > 1);

{
    _pos = getPos _x;
    _dist = (_cam distance _pos) + 0.1;
    
    if (_dist < 2000) then {
    
        _distScaled = SCALE / sqrt(_dist);
        _iconScale = 300 * _distScaled;
        //_iconSize = (20 * _size) max _scale min _min;
        _iconSize = _iconScale max ICONMAX min ICONMIN;
        _textSize = 0;
        
        if (_showText) then {
            _textScale = 10 * _distScaled;
            _textSize = _textScale max TEXTMAX min TEXTMIN;
        };
            
        _magName = getText (configFile >> "CfgAmmo" >> (typeOf _x) >> "defaultMagazine");
        _name = getText (configFile >> "CfgMagazines" >> _magName >> "displayName");
        
        drawIcon3D [TEXTURE, [1,0.5,0,1], _pos, _iconSize, _iconSize, 0, _name, 1, _textSize, "PuristaMedium"];
    };
} forEach allMines;