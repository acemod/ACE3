/*
 * Author: commy2, CAA-Picard
 *
 * Draw the nametag and rank icon.
 *
 * Argument:
 * 0: Unit (Array)
 * 1: alpha (Number)
 * 2: Height offset (Number)
 *
 * Return value:
 * None.
 */

#include "script_component.hpp"

#define TEXTURES_RANKS [ \
    "", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa" \
]

private ["_player", "_target", "_alpha", "_heightOffset", "_height", "_position", "_color", "_name", "_rank", "_size"];

PARAMS_4(_player,_target,_alpha,_heightOffset);

_name = [_target, true] call EFUNC(common,getName);

_icon = "";
_size = 0;

if (GVAR(showSoundWaves) && {(_target getVariable [QGVAR(isSpeaking), false]) && {(vehicle _target) == _target}}) then {
    _icon = QUOTE(PATHTOF(UI\soundwave)) + str (floor (random 10)) + ".paa";
    _size = 0.75;
    _alpha = _alpha + 0.6;//Boost alpha when speaking
} else {
    if (GVAR(showPlayerRanks)) then {
        _icon = TEXTURES_RANKS select ((["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"] find (rank _target)) + 1);
        _size = 0.75;
    };
};

if (_alpha < 0) exitWith {}; //Don't waste time if not visable

if !(group _target == group _player) then {
    _color = +GVAR(defaultNametagColor); //Make a copy, then multiply both alpha values (allows client to decrease alpha in settings)
    _color set [3, (_color select 3) * _alpha];
} else {
    _color = [[1, 1, 1, _alpha], [1, 0, 0, _alpha], [0, 1, 0, _alpha], [0, 0, 1, _alpha], [1, 1, 0, _alpha]] select (["MAIN", "RED", "GREEN", "BLUE", "YELLOW"] find (if (_target == _player) then {0} else {assignedTeam _target})) max 0
};

_height = [2, 1.5, 1, 1.5, 1] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find (stance _target));

// Convert position to ASLW (expected by drawIcon3D) and add height offsets
_position = _target modelToWorldVisual [0, 0, (_height + _heightOffset)];

drawIcon3D [
    _icon,
    _color,
    _position,
    _size,
    _size,
    0,
    _name,
    2,
    0.033,
    "PuristaMedium"
];
