/*
    Author:
    voiper

    Description:
    Draw unit icons on spectator map.

    Arguments:
    0: Map control <Control>
    1: Zoom level <Scalar>

    Example:
    [map, zoomlevel] call ace_spectator_fnc_drawUnits2D;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

#define SCALE 5 * safeZoneH / 100
#define MIN 300 * SCALE

_map = _this select 0;
_zoom = _this select 1;

_topIcon = [];

_size = SCALE / _zoom;
_showText = (GVAR(markers) > 1);
_textSize = (0.25 * _size) max (SCALE / 2) min (SCALE / 1.5);

{
    _unit = _x;
    _isTarget = (_unit == GVAR(unit));

    if (true) then {

        _veh = vehicle _unit;
        _inVeh = (_veh != _unit);
        if (!_isTarget && _inVeh && !(_unit == ((crew _veh) select 0))) exitWith {};
        if (!_isTarget && _inVeh && (GVAR(unit) in (crew _veh))) exitWith {};

        _obj = if (_inVeh) then {_veh} else {_unit};
        _pos = getPosVisual _obj;
        _dir = getDir _obj;

        _info = [_unit] call FUNC(unitInfo);
        _name = _info select 0;
        _colour = _info select 2;

        _icon = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Icon");
        _iconSize = 0;
        _iconText = "";

        if (_inVeh) then {
            _iconSize = (50 * _size) max SCALE min (MIN * 2);
            if (_showText) then {
                _iconText = "[" + (getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")) + "] " + _name;
            };
        } else {
            _iconSize = (50 * _size) max SCALE min MIN;
            if (_showText) then {
                _iconText = _name;
            };
        };

        if (_isTarget) exitWith {
            _topIcon = [_icon, [1,1,0,1], _pos, _iconSize, _iconSize, _dir, _iconText, 1, _textSize, "PuristaBold", "RIGHT"];
        };
            
        _map drawIcon [_icon, _colour, _pos, _iconSize, _iconSize, _dir, _iconText, 1, _textSize, "PuristaMedium", "RIGHT"]
    };
} forEach GVAR(units);

if (count _topIcon > 0) then {
    _map drawIcon _topIcon;
};