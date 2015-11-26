/*
 * Author: commy2, esteldunedain
 * Draw the nametag and rank icon.
 *
 * Arguments:
 * 0: Unit (Player) <OBJECT>
 * 1: Target <OBJECT>
 * 2: Alpha <NUMBER>
 * 4: Height offset <NUMBER>
 * 5: Draw Type <NUMBER>
 *
 * Return value:
 * None
 *
 * Example:
 * [ACE_player, bob, 0.5, height, ICON_NAME_SPEAK] call ace_nametags_fnc_drawNameTagIcon
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_player", "_target", "_alpha", "_heightOffset", "_iconType"];

if (_iconType == ICON_NONE) exitWith {}; //Don't waste time if not visable

private ["_position", "_color", "_name", "_size", "_icon", "_scale"];

//Set Icon:
_icon = "";
_size = 0;
if (_iconType in [ICON_NAME_SPEAK, ICON_SPEAK]) then {
    _icon = format ["%1%2%3",QUOTE(PATHTOF(UI\soundwave)), floor (random 10), ".paa"];
    _size = 1;
    _alpha = (_alpha max 0.2) + 0.2;//Boost alpha when speaking
} else {
    if (_iconType == ICON_NAME_RANK) then {
        _icon = format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa",(toLower(rank _target))];
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
_color = if ((group _target) != (group _player)) then {
    +GVAR(defaultNametagColor); //Make a copy, then multiply both alpha values (allows client to decrease alpha in settings)
} else {
    [[1, 1, 1, _alpha], [1, 0, 0, _alpha], [0, 1, 0, _alpha], [0, 0, 1, _alpha], [1, 1, 0, _alpha]] select ((["MAIN", "RED", "GREEN", "BLUE", "YELLOW"] find (assignedTeam _target)) max 0);
};

if (isNil "_color") then {
    _color = [1, 1, 1, _alpha];
};

_color set [3, (_color select 3) * _alpha];

// Convert position to ASLW (expected by drawIcon3D) and add height offsets
_position = _target modelToWorldVisual ((_target selectionPosition "pilot") vectorAdd [0,0,(_heightOffset + .3)]);

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
