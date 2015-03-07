/*
 * Author: NouberNou and CAA-Picard
 * Render an interaction menu and it's children recursively
 *
 * Argument:
 * 0: Object <OBJECT>
 * 1: Action data <ARRAY>
 * 2: 3D position <ARRAY>
 * 3: Angle range available for rendering <ARRAY>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_menuInSelectedPath", "_path", "_menuDepth", "_currentRenderDepth", "_x", "_offset", "_newPos", "_forEachIndex"];

EXPLODE_4_PVT(_this,_object,_action,_pos,_angles);
EXPLODE_2_PVT(_action,_actionData,_activeChildren);
EXPLODE_2_PVT(_angles,_centerAngle,_maxAngleSpan);

_menuDepth = (count GVAR(menuDepthPath)) - 1;

// Store path to action
_path = [_object] + (_actionData select 7);

// Check if the menu is on the selected path
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
if(!_menuInSelectedPath) then { //_menuDepth > 0 &&
    if (_menuDepth > 0) then {
        _color = format ["#%1FFFFFF", [255 * ((((count _path) - 2)/_menuDepth) max 0.25)] call EFUNC(common,toHex)];
    } else {
        _color = format ["#%1FFFFFF", [255 * 0.75] call EFUNC(common,toHex)];
    };
};
[_actionData select 0, _color, _pos, 1, 1, 0, _actionData select 1, 0.5, 0.025, "TahomaB"] call FUNC(renderIcon);

// Add the action to current options
GVAR(currentOptions) pushBack [_this, _pos, _path];

// Exit without rendering children if it isn't
if !(_menuInSelectedPath) exitWith {true};

private ["_angleSpan","_angle"];
_angleSpan = _maxAngleSpan min (55 * ((count _activeChildren) - 1));
if (_angleSpan >= 305) then {
    _angleSpan = 360;
};

_angle = _centerAngle - _angleSpan / 2;
{
    _target = _object;
    _player = ACE_player;

    _mod = (0.15 max (0.15 * ((positionCameraToWorld [0, 0, 0]) distance _pos))) / GVAR(selfMenuScale);

    _offset = ((GVAR(refSystem) select 1) vectorMultiply (-_mod * cos _angle)) vectorAdd
                ((GVAR(refSystem) select 2) vectorMultiply (-_mod * sin _angle));
    _newPos = ((_pos call EFUNC(common,positionToASL)) vectorAdd _offset) call EFUNC(common,ASLToPosition);

    //drawLine3D [_pos, _newPos, [1,0,0,0.5]];

    [_object, _x, _newPos, [_angle, 140]] call FUNC(renderMenu);

    if (_angleSpan == 360) then {
        _angle = _angle + _angleSpan / (count _activeChildren);
    } else {
        _angle = _angle + _angleSpan / (((count _activeChildren)-1) max 1);
    };
} forEach _activeChildren;

true
