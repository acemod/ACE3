/*
 * Author: commy2, esteldunedain
 *
 * Draw the nametag and rank icon.
 *
 * Argument:
 * 0: Unit (Player) <OBJECT>
 * 1: Target <OBJECT>
 * 2: alpha (Number)
 * 4: Height offset (Number)
 * 5: Draw Type <NUMBER>
 *
 * Return value:
 * None.
 */

#include "script_component.hpp"

PARAMS_5(_player,_target,_alpha,_heightOffset,_iconType);

private ["_position", "_color", "_name", "_rank", "_size", "_icon", "_scale"];

if (_iconType == ICON_NONE) exitWith {}; //Don't waste time if not visable

//Set Icon:
_icon = "";
_size = 0;
if ((_iconType == ICON_NAME_SPEAK) || (_iconType == ICON_SPEAK)) then {
    _icon = QUOTE(PATHTOF(UI\soundwave)) + str (floor (random 10)) + ".paa";
    _size = 1;
    _alpha = _alpha max 0.6;//Boost alpha when speaking
} else {
    if (_iconType == ICON_NAME_RANK) then {
        _icon = TEXTURES_RANKS select ((["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"] find (rank _target)) + 1);
        _size = 1;
    };
};

if (_alpha < 0) exitWith {}; //Don't waste time if not visable

//Set Text:
_name = if (_iconType in [ICON_NAME, ICON_NAME_RANK, ICON_NAME_SPEAK]) then {
    [_target, true] call EFUNC(common,getName)
} else {
    ""
};

//Set Color:
if !(group _target == group _player) then {
    _color = +GVAR(defaultNametagColor); //Make a copy, then multiply both alpha values (allows client to decrease alpha in settings)
    _color set [3, (_color select 3) * _alpha];
} else {
    _color = [[1, 1, 1, _alpha], [1, 0, 0, _alpha], [0, 1, 0, _alpha], [0, 0, 1, _alpha], [1, 1, 0, _alpha]] select (["MAIN", "RED", "GREEN", "BLUE", "YELLOW"] find (if (_target == _player) then {0} else {assignedTeam _target})) max 0
};

// Convert position to ASLW (expected by drawIcon3D) and add height offsets
_position = _target modelToWorldVisual ((_target selectionPosition "pilot") vectorAdd [0,0,(_heightOffset + .35)]);

_scale = [0.333, 0.5, 0.666, 0.83333, 1] select GVAR(tagSize);

drawIcon3D [
_icon,
_color,
_position,
(_size * _scale),
(_size * _scale),
0,
_name,
2,
(0.05 * _scale),
"PuristaMedium"
];
