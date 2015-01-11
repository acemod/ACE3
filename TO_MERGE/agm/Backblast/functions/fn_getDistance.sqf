// by commy2

private ["_position", "_direction", "_maxDistance", "_distance", "_iteration", "_laser", "_line"];

_position = + _this select 0;
_direction = + _this select 1;
_maxDistance = _this select 2;

_distance = _maxDistance;
_iteration = _distance;
_laser = [];
_line = [_position, _laser];

while {
  _iteration > 0.1
} do {
  _iteration = _iteration / 2;

  _laser set [0, (_position select 0) - _distance * (_direction select 0)];
  _laser set [1, (_position select 1) - _distance * (_direction select 1)];
  _laser set [2, (_position select 2) - _distance * (_direction select 2)];

  _intersections = {
    _x isKindOf "Static" || {_x isKindOf "AllVehicles"}
  } count (lineIntersectsWith _line);

  _distance = _distance + ([1, -1] select (_intersections > 0)) * _iteration;
};

if (_distance > _maxDistance) then {999} else {_distance}
