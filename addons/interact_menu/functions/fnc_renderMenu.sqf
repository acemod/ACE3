//fnc_renderMenu.sqf
#include "script_component.hpp"

private ["_object", "_actionData", "_distance", "_uid", "_pos", "_cursorScreenPos", "_path", "_menuDepth", "_opacity", "_currentRenderDepth", "_radialOffset", "_active", "_x", "_offset", "_newPos", "_forEachIndex"];

_object = _this select 0;
_actionData = _this select 1;
_uid = _actionData select 7;//_this select 2;
_angles = _this select 3;

_distance = _actionData select 5;
EXPLODE_2_PVT(_angles,_centerAngle,_maxAngleSpan);

if((count _this) > 4) then {
    _pos = _this select 4;
} else {
    if(typeName (_actionData select 2) == "ARRAY") then {
        _pos = _object modelToWorld (_actionData select 2);
    } else {
        _pos = _object modelToWorld (_object selectionPosition (_actionData select 2));
    };
};
_cursorScreenPos = (positionCameraToWorld [0, 0, 0]);
if(_cursorScreenPos distance _pos <= _distance) then {
    _path = [];
    if((count _this) > 5) then {
        _path = +(_this select 5);
    };
    _menuDepth = (count GVAR(menuDepthPath));

    // ARGB Color (First Hex Pair is transparancy)
    _color = "#FFFFFFFF";
    if(_menuDepth > 0 && _uid != (GVAR(menuDepthPath) select (GVAR(renderDepth)))) then {
        _color = format ["#%1FFFFFF", [255 * (((GVAR(renderDepth)/_menuDepth)) max 0.25)] call EFUNC(common,toHex)];
    };
    _path set[(count _path), _uid];
    [_actionData select 0, _color, _pos, 1, 1, 0, _actionData select 1, 0.5, 0.025, "TahomaB"] call FUNC(renderIcon);
    GVAR(currentOptions) set[(count GVAR(currentOptions)), [_this, _pos, _path]];
    _currentRenderDepth = -1;
    _currentRenderDepth = GVAR(renderDepth);
    GVAR(renderDepth) = GVAR(renderDepth) + 1;
    if(_uid == (GVAR(menuDepthPath) select (GVAR(renderDepth)-1))) then {
        // Count how many actions are active
        private "_numActions";
        _numActions = 0;
        {
            this = _object;
            _target = _object;
            _player = ACE_player;
            _active = [_object, ACE_player] call (_x select 4);
            if(_active) then {
                _numActions = _numActions + 1;
            };
        } forEach (_actionData select 6);
        systemChat format ["Menu %1, _numActions: %2", _actionData select 0, _numActions];

        private "_angleSpan";
        _angleSpan = _maxAngleSpan min (55 * (_numActions - 1));

        private "_angle";
        _angle = _centerAngle - _angleSpan / 2;
        {
            this = _object;
            _target = _object;
            _player = ACE_player;
            _active = [_object, ACE_player] call (_x select 4);
            // diag_log text format["_active: %1: %2", (_x select 0), _active];
            if(_active) then {
                //systemChat format ["_angle: %1", _angle];
                _offset = [GVAR(vecLineMap), _angle] call FUNC(rotateVectLine);
                _mod = 0.15 max (0.15 * (_cursorScreenPos distance _pos)); //0.5;//0.1*_distance;
                _newPos = [
                    (_pos select 0) + ((_offset select 0)*_mod),
                    (_pos select 1) + ((_offset select 1)*_mod),
                    (_pos select 2) + ((_offset select 2)*_mod)
                ];
                // drawLine3D [_pos, _newPos, [1,0,0,0.5]];
                [_object, _x, _forEachIndex, [_angle, 150], _newPos, _path] call FUNC(renderMenu);

                if (_angle == 360) then {
                    _angle = _angle + _angleSpan / _numActions;
                } else {
                    _angle = _angle + _angleSpan / ((_numActions-1) max 1);
                };
            };
        } forEach (_actionData select 6);
    };
    GVAR(renderDepth) = GVAR(renderDepth) - 1;
};
