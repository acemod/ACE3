//fnc_renderMenu.sqf
#include "script_component.hpp"

private ["_object", "_actionData", "_distance", "_index", "_pos", "_cursorScreenPos", "_path", "_menuDepth", "_opacity", "_currentRenderDepth", "_radialOffset", "_active", "_x", "_offset", "_newPos", "_forEachIndex"];

_object = _this select 0;
_actionData = _this select 1;
_distance = _actionData select 5;
_index = _this select 2;

if((count _this) > 3) then {
	_pos = _this select 3;
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
	if((count _this) > 4) then {
		_path = +(_this select 4);
	};
	_menuDepth = (count GVAR(menuDepthPath));

	_opacity = 1;
	if(_menuDepth > 0 && _index != (GVAR(menuDepthPath) select (GVAR(renderDepth)))) then {
		_opacity = ((GVAR(renderDepth)/_menuDepth)) max 0.25;
	};
	_path set[(count _path), _index];
	// player sideChat format["r: %1", _actionData select 2];
	[_actionData select 0, [1,1,1,_opacity], _pos, 1, 1, 0, _actionData select 1, 0.5, 0.025, "TahomaB"] call FUNC(renderIcon);
	GVAR(currentOptions) set[(count GVAR(currentOptions)), [_this, _pos, _path]];
	_currentRenderDepth = -1;
	_currentRenderDepth = GVAR(renderDepth);
	GVAR(renderDepth) = GVAR(renderDepth) + 1;
	if(_index == (GVAR(menuDepthPath) select (GVAR(renderDepth)-1))) then {
		_radialOffset = 0;
		{
            // if(_index != (GVAR(menuDepthPath) select (GVAR(renderDepth)))) then {
                this = _object;
                _target = _object;
                _player = ACE_player;
                _active = [_object, ACE_player] call (_x select 4);
                // diag_log text format["_active: %1: %2", (_x select 0), _active];
                if(_active) then {
                    _offset = [GVAR(vecLineMap), (270*(GVAR(renderDepth)%2))-(_radialOffset*45)] call FUNC(rotateVectLine);
                    _mod = 0.1*_distance;
                    _newPos = [
                        (_pos select 0) + ((_offset select 0)*_mod),
                        (_pos select 1) + ((_offset select 1)*_mod),
                        (_pos select 2) + ((_offset select 2)*_mod)
                    ];
                    // drawLine3D [_pos, _newPos, [1,0,0,1]];
                    [_object, _x, _forEachIndex, _newPos, _path] call FUNC(renderMenu);
                    _radialOffset = _radialOffset + 1;
                };
            // };
		} forEach (_actionData select 6);
	};
	GVAR(renderDepth) = GVAR(renderDepth) - 1;
};
