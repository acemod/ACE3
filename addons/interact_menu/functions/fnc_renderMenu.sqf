/*
 * Author: NouberNou and CAA-Picard
 * Render a interaction menu and it's children recursively
 *
 * Argument:
 * 0: Object <OBJECT>
 * 1: Action data <ARRAY>
 * 2: ?
 * 3: Angle range available for rendering <ARRAY>
 * 4: 3D position <ARRAY> (Optional)
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_distance", "_uid", "_pos", "_cursorScreenPos", "_path", "_menuDepth", "_opacity", "_currentRenderDepth", "_radialOffset", "_active", "_x", "_offset", "_newPos", "_forEachIndex"];

EXPLODE_4_PVT(_this,_object,_actionData,_dummy,_angles);
EXPLODE_2_PVT(_angles,_centerAngle,_maxAngleSpan);

_uid = _actionData select 7;
_distance = _actionData select 5;

// Obtain a 3D position for the action
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
// Exit if the action is too far away
if(_cursorScreenPos distance _pos >= _distance) exitWith {};

// Exit if the action is behind you
if(_cursorScreenPos select 2 < 0) exitWith {};

_menuDepth = (count GVAR(menuDepthPath)) - 1;

// Store path to action
_path = [_object];
_path = _path + (_actionData select 8);

// Check if the menu is on the selected path
private "_menuInSelectedPath";
_menuInSelectedPath = true;
{
    if (_forEachIndex >= (count GVAR(menuDepthPath))) exitWith {
        _menuInSelectedPath = false;
    };
    if (_x != (GVAR(menuDepthPath) select _forEachIndex)) exitWith {
        _menuInSelectedPath = false;
    };
} forEach _path;

// Render icon
// ARGB Color (First Hex Pair is transparancy)
_color = "#FFFFFFFF";
if(_menuDepth > 0 && !_menuInSelectedPath) then {
    _color = format ["#%1FFFFFF", [255 * ((((count _path) - 2)/_menuDepth) max 0.25)] call EFUNC(common,toHex)];
};
[_actionData select 0, _color, _pos, 1, 1, 0, _actionData select 1, 0.5, 0.025, "TahomaB"] call FUNC(renderIcon);

// Add the action to current options
GVAR(currentOptions) pushBack [_this, _pos, _path];

// Exit without rendering children if it isn't
if !(_menuInSelectedPath) exitWith {};

// Collect all active children actions
private "_activeChildren";
_activeChildren = [];
// Collect children class actions
{
    _target = _object;
    _player = ACE_player;
    _active = [_object, ACE_player] call (_x select 4);
    if(_active) then {
        _activeChildren pushBack _x;
    };
} forEach (_actionData select 6);

// Collect children object actions
{
    _actionItem = _x;

    // Check if the action is children of the selected menu
    if ((count (_actionItem select 8)) == (count _path)) then {
        // Compare parent path to see if it's a suitable child
        private "_isChild";
        _isChild = true;
        for "_i" from 0 to (count (_actionItem select 8)) - 2 do {
            if !(((_actionItem select 8) select _i) isEqualTo (_path select (_i + 1))) exitWith {
                _isChild = false;
            };
        };
        if (_isChild) exitWith {
            _target = _object;
            _player = ACE_player;
            _active = [_target, ACE_player] call (_actionItem select 4);

            if (_active) then {
                _activeChildren pushBack _actionItem;
            };
        };
    };
} forEach GVAR(objectActions);

private ["_angleSpan","_angle"];
_angleSpan = _maxAngleSpan min (55 * ((count _activeChildren) - 1));
if (_angleSpan >= 305) then {
    _angleSpan = 360;
};

_angle = _centerAngle - _angleSpan / 2;

{
    _target = _object;
    _player = ACE_player;

    _offset = [GVAR(vecLineMap), _angle] call FUNC(rotateVectLine);
    _mod = 0.15 max (0.15 * (_cursorScreenPos distance _pos));
    _newPos = _pos vectorAdd (_offset vectorMultiply _mod);

    // drawLine3D [_pos, _newPos, [1,0,0,0.5]];

    [_object, _x, _forEachIndex, [_angle, 140], _newPos] call FUNC(renderMenu);

    if (_angleSpan == 360) then {
        _angle = _angle + _angleSpan / (count _activeChildren);
    } else {
        _angle = _angle + _angleSpan / (((count _activeChildren)-1) max 1);
    };
} forEach _activeChildren;
