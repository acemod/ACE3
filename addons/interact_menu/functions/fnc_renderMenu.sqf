/*
 * Author: NouberNou and esteldunedain
 * Render an interaction menu and it's children recursively
 *
 * Argument:
 * 0: Parent path <ARRAY>
 * 1: Action data <ARRAY>
 * 2: 2D position <ARRAY>
 * 3: Angle range available for rendering <ARRAY>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_menuInSelectedPath", "_path", "_menuDepth", "_x", "_offset", "_newPos", "_forEachIndex", "_player", "_pos", "_target", "_textSettings"];

params ["_parentPath", "_action", "_sPos", "_angles"];
_action params ["_actionData", "_activeChildren", "_actionObject"];
_angles params ["_centerAngle", "_maxAngleSpan"];

_menuDepth = (count GVAR(menuDepthPath));

//BEGIN_COUNTER(constructing_paths);

// Store path to action
_path = +_parentPath;
_path pushBack [_actionData select 0,_actionObject];

// Check if the menu is on the selected path
_menuInSelectedPath = true;
{
    if (_forEachIndex >= (count GVAR(menuDepthPath))) exitWith {
        _menuInSelectedPath = false;
    };
    if !(_x isEqualTo (GVAR(menuDepthPath) select _forEachIndex)) exitWith {
        _menuInSelectedPath = false;
    };
} forEach _path;

//END_COUNTER(constructing_paths);
//BEGIN_COUNTER(constructing_colors);

//Get text color settings string
_textSettings = GVAR(colorSelectedSettings);
if(!_menuInSelectedPath) then {
    _textSettings = (GVAR(textSettingsMatrix) select (count _path)) select _menuDepth;
};

//END_COUNTER(constructing_colors);
//BEGIN_COUNTER(fnc_renderIcons);

[_actionData select 1, _actionData select 2, _sPos, _textSettings] call FUNC(renderIcon);

//END_COUNTER(fnc_renderIcons);

//BEGIN_COUNTER(currentOptions);

// Add the action to current options
GVAR(currentOptions) pushBack [_this, _sPos, _path];

//END_COUNTER(currentOptions);

// Exit without rendering children if it isn't
if !(_menuInSelectedPath) exitWith {true};

//BEGIN_COUNTER(children);

private ["_numChildren","_angleSpan","_angle","_angleInterval","_scaleX", "_scaleY", "_offset", "_textSize"];
_numChildren = count _activeChildren;
_angleSpan = _maxAngleSpan min (55 * ((_numChildren) - 1));
if (_angleSpan >= 305) then {
    _angleSpan = 360;
};
_angleInterval = 55;
if (_angleSpan < 360) then {
    if (_numChildren > 1) then {
        _angleInterval = _angleSpan / (_numChildren - 1);
    };
} else {
    _angleInterval = _angleSpan / (_numChildren);
};
if (_numChildren == 1) then {
    _angleInterval = 55;
};

// Scale menu based on the amount of children
_scaleX = 1;
_scaleY = 1;

if (GVAR(UseListMenu)) then {
    _textSize = [0.75, 0.875, 1, 1.2, 1.4] select GVAR(textSize);
    _scaleX = _textSize * 0.17 * 1.1;
    _scaleY = 0.17 * 0.30 * 4/3;
} else {
    _textSize = if (GVAR(textSize) > 2) then {1.3} else {1};
    _scaleX = _textSize * 0.17 * (((0.8 * (0.46 / sin (0.5 * _angleInterval))) min 1.1) max 0.5);
    _scaleY = _textSize * 0.17 * 4/3 * (((0.8 * (0.46 / sin (0.5 * _angleInterval))) min 1.1) max 0.5);
};

// Animate menu scale
if (_menuInSelectedPath && (_menuDepth == count _path)) then {
    _scaleX = _scaleX * (0.3 + 0.7 * (((ACE_diagTime - GVAR(expandedTime)) * 8) min 1));
    _scaleY = _scaleY * (0.3 + 0.7 * (((ACE_diagTime - GVAR(expandedTime)) * 8) min 1));
};

_target = _actionObject;
_player = ACE_player;

//END_COUNTER(children);
_angle = _centerAngle - _angleSpan / 2;
{
    //BEGIN_COUNTER(children);
    private ["_offset","_newPos"];
    _newPos =  if (GVAR(UseListMenu)) then {
        [(_sPos select 0) + _scaleX,
         (_sPos select 1) + _scaleY * (_forEachIndex - _numChildren/2 + 0.5)];
    } else {
        [(_sPos select 0) - _scaleX * (cos _angle),
         (_sPos select 1) + _scaleY * (sin _angle)];
    };

    //drawLine3D [_pos, _newPos, [1,0,0,0.8]];
    //END_COUNTER(children);
    [_path, _x, _newPos, [_angle, 150]] call FUNC(renderMenu);

    _angle = _angle + _angleInterval;
} forEach _activeChildren;

true
