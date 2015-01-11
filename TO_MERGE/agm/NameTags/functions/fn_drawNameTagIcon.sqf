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

_player = _this select 0;
_target = _this select 1;
_alpha = _this select 2;
_heightOffset = _this select 3;

_height = [2, 1.5, 1, 1.5, 1] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find stance _target);

_position = visiblePositionASL _target;
// Convert position to ASLW (expected by drawIcon3D) and add height offsets
_position set [2, ((_target modelToWorld [0,0,0]) select 2) + _height + _heightOffset];

_color = if !(group _target == group _player) then {
  [0.77, 0.51, 0.08, _alpha]
} else {
  [[1, 1, 1, _alpha], [1, 0, 0, _alpha], [0, 1, 0, _alpha], [0, 0, 1, _alpha], [1, 1, 0, _alpha]] select (["MAIN", "RED", "GREEN", "BLUE", "YELLOW"] find (if (_target == _player) then {0} else {assignedTeam _target})) max 0
};

_name = [_target, true] call AGM_Core_fnc_getName;

_rank = TEXTURES_RANKS select ((["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"] find rank _target) + 1);
_size = [0, 1] select (profileNamespace getVariable ["AGM_showPlayerRanks", true]);

drawIcon3D [
  _rank,
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
