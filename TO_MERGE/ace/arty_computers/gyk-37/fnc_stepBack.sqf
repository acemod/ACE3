// #define DEBUG_MODE_FULL
#include "script_component.hpp"



TRACE_1("", _this);

_airFriction = (_this select 0);
_vel = (_this select 1);
_useElevation = (_this select 2);
_y = (_this select 3);
_stepDis = (_this select 4);
_x = (_this select 5);
_time = (_this select 6);
_checkDistance = _x - _stepDis;
_vx = _vel * cos(_useElevation);
_vy = _vel * sin(_useElevation);
_grav = -9.80665;


_frame = 1/60;
_elev = 0;
while {_x >= _checkDistance} do
{
	_vx = _vx - (_vx * _vel * _airFriction * _frame);
	_vy = _vy - (_vy * _vel * _airFriction * _frame);
	_vy = _vy + (abs(_grav * _frame));
	_vel = sqrt(_vx*_vx + _vy*_vy);
	_elev = asin (_vy / _vel);
	_y = _y - (_vy * _frame);
	_x = _x - (_vx * _frame);
	_time = _time - _frame;
};
[_x, _y, _vel, _elev, _time]