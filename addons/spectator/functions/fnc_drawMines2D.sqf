/*
    Author:
    voiper

    Description:
    Draw mines on spectator map.

    Arguments:
    0: Map control <Control>
    1: Zoom level <Scalar>

    Example:
    [map, zoomlevel] call ace_spectator_fnc_drawMines2D;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

#define SCALE 5 * safeZoneH / 100
#define MIN 300 * SCALE
#define TEXTURE "\A3\ui_f\data\map\markers\military\triangle_CA.paa"

_map = _this select 0;
_zoom = _this select 1;

_size = SCALE / _zoom;
_textSize = ((1/4 * _size) max (SCALE / 2) min (SCALE / 1.5)) / 2;
_iconSize = (20 * _size) max SCALE min MIN;
_showText = (GVAR(markers) > 1);

{
    _name = "";
    if (_showText) then {
        _magName = getText (configFile >> "CfgAmmo" >> (typeOf _x) >> "defaultMagazine");
        _name = getText (configFile >> "CfgMagazines" >> _magName >> "displayName");
    };
    _map drawIcon [TEXTURE, [1,0.5,0,1], getPos _x, _iconSize, _iconSize, getDir _x, _name, 1, _textSize, "PuristaMedium"];
} forEach allMines;
