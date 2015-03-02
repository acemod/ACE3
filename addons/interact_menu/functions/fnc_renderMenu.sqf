/*
 * Author: NouberNou and CAA-Picard
 * Render a interaction menu and it's children recursively
 *
 * Argument:
 * 0: Object <OBJECT>
 * 1: Action data <ARRAY>
 * 2: Was the condition already checked? <BOOL>
 * 3: Angle range available for rendering <ARRAY>
 * 4: 3D position <ARRAY> (Optional)
 *
 * Return value:
 * Was the menu rendered <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_distance", "_uid", "_pos", "_cameraPos", "_path", "_menuDepth", "_opacity", "_currentRenderDepth", "_radialOffset", "_active", "_x", "_offset", "_newPos", "_forEachIndex"];

EXPLODE_4_PVT(_this,_object,_actionData,_wasConditionChecked,_angles);
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
        if ((_actionData select 2) == "weapon") then {
            // Craft a suitable position for weapon interaction
            _weaponDir = _object weaponDirection currentWeapon _object;
            _ref = _weaponDir call EFUNC(common,createOrthonormalReference);
            _pos = (_object modelToWorld (_object selectionPosition "righthand")) vectorAdd ((_ref select 2) vectorMultiply 0.1);
        } else {
            _pos = _object modelToWorld (_object selectionPosition (_actionData select 2));
        };
    };
};

// For non-self actions, exit if the action is too far away
_cameraPos = positionCameraToWorld [0, 0, 0];
if (GVAR(keyDown) && {_cameraPos distance _pos >= _distance}) exitWith {false};

// Exit if the action is behind you
_sPos = worldToScreen _pos;
if(count _sPos == 0) exitWith {false};

// Exit if the action is off screen
if ((_sPos select 0) < safeZoneXAbs || (_sPos select 0) > safeZoneXAbs + safeZoneWAbs) exitWith {false};
if ((_sPos select 1) < safeZoneY    || (_sPos select 1) > safeZoneY    + safeZoneH) exitWith {false};

// If the condition was not checked, check it and exit if needed
if (!_wasConditionChecked && {!([_target, ACE_player] call (_actionItem select 4))}) exitWith {false};

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

// Collect all active children actions
private "_activeChildren";
_activeChildren = [_object,_actionData] call FUNC(collectActiveChildren);

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
    _mod = (0.15 max (0.15 * (_cameraPos distance _pos))) / GVAR(selfMenuScale);
    _newPos = _pos vectorAdd (_offset vectorMultiply _mod);

    // drawLine3D [_pos, _newPos, [1,0,0,0.5]];

    [_object, _x, true, [_angle, 140], _newPos] call FUNC(renderMenu);

    if (_angleSpan == 360) then {
        _angle = _angle + _angleSpan / (count _activeChildren);
    } else {
        _angle = _angle + _angleSpan / (((count _activeChildren)-1) max 1);
    };
} forEach _activeChildren;

true
