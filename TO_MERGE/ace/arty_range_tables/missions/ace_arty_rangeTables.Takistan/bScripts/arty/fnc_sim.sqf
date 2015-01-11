private ["_celev", "_altitude_impact", "_initspeed", "_airfriction", "_deltat","_adjust"];
private ["_gravity", "_pos_x", "_pos_y", "_speed", "_speed_x", "_speed_y", "_flytime", "_altitude_apogee"];

_celev = _this select 0;
_altitude_impact = _this select 1;
_initspeed = _this select 2;
_airfriction = _this select 3;
_deltat = _this select 4;
_adjust = _this select 5;

_gravity = 9.80665;

// Init
_pos_x = 0;
_pos_y = 0;
_speed_x = _initspeed * cos(_celev);
_speed_y = _initspeed * sin(_celev);
_flytime = 0;
_altitude_apogee = 0;

while {_pos_y > _altitude_impact || _speed_y > 0} do
{
	_pos_x = _pos_x + (_speed_x * _deltat);
	_pos_y = _pos_y + (_speed_y * _deltat);
	_speed = sqrt(_speed_x^2+_speed_y^2);
	_speed_x = _speed_x - (_airfriction * _speed_x * _speed * _deltat);
	_speed_y = _speed_y - (_airfriction * _speed_y * _speed * _deltat) - (_gravity * _deltat);
	_flytime = _flytime + _deltat;
};
_pos_x = _pos_x*_adjust;

[_celev,_pos_x, _flytime]