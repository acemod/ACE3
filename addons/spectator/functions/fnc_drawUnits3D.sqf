/*
    Author:
    voiper

    Description:
    Draw unit icons in 3D.

    Arguments:
    None

    Example:
    call ace_spectator_fnc_drawUnits3D;

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

_cam = GVAR(cam);
_showText = (GVAR(markers) > 1);
_topIcon = [];

{
    _unit = _x;

    if (true) then {
        _veh = vehicle _unit;
        _inVeh = (_veh != _unit);
        _cmdr = if (_inVeh && (_unit == ((crew _veh) select 0))) then {true} else {false};

        _obj = if (_inVeh && _cmdr) then {_veh} else {_unit};
        _pos = if (surfaceIsWater getPos _obj) then {getPosASLVisual _obj} else {getPosATLVisual _obj};
        _dist = (_cam distance _pos) + 0.1;

        _isTarget = (_unit == GVAR(unit));

        //exit if too far
        if (_dist > 2000 && !_isTarget) exitWith {};

        //exit if target not on screen
        if ((count (worldToScreen _pos) < 1) && !_isTarget) exitWith {};

        _info = [_unit] call FUNC(unitInfo);
        _name = _info select 0;
        _colour = _info select 2;

        _pos set [2, (_pos select 2) + 3];
        _distScaled = SCALE / sqrt(_dist);

        _icon = "";
        _iconScale = 300 * _distScaled;
        _iconSize = _iconScale max ICONMAX min ICONMIN;

        _text = if (_showText) then {_name} else {""};
        _textScale = 10 * _distScaled;
        _textSize = _textScale max TEXTMAX min TEXTMIN;

        if (_inVeh) then {
            if (_cmdr) then {
                _icon = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Icon");
                _text = if (_showText) then {
                    "[" + (getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")) + "] " + _text
                } else {""};
                _pos set [2, (_pos select 2) + 3];
            } else {
                _iconSize = 0;
                _textSize = if (_dist < 25) then {_textSize / 1.5} else {0};
            };
        } else {
            _icon = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "Icon");
        };

        if (GVAR(markers) > 2) then {
            _text = _text + " [" + str ceil(_dist) + "]";
        };

        if (_isTarget) exitWith {
            _topIcon = [_icon, [1,1,0,1], _pos, _iconSize, _iconSize, 0, _text, 2, _textSize, "PuristaBold", "CENTER", true];
        };

        drawIcon3D [_icon, _colour, _pos, _iconSize, _iconSize, 0, _text, 2, _textSize, "PuristaMedium"];
    };
} forEach GVAR(units);

if ((count _topIcon > 0) && GVAR(cameraOn)) then {
    drawIcon3D _topIcon;
};
