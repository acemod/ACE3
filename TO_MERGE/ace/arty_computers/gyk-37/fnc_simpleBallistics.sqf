// #define DEBUG_MODE_FULL
#include "script_component.hpp"



TRACE_1("", _this);
private["_airFriction","_vel","_useElevation","_y", "_vx", "_vy", "_grav", "_x", "_frame"];

_airFriction = (_this select 0);
_vel = (_this select 1);
_useElevation = (_this select 2);
_y = (_this select 3);
_vx = _vel * cos(_useElevation);
_vy = _vel * sin(_useElevation);
_grav = -9.80665;
_x = 0;

_frame = 1/60;

while {_y >= 0} do
{
	_vx = _vx + (_vx * _vel * _airFriction * _frame);
	_vy = _vy + (_vy * _vel * _airFriction * _frame);
	_vy = _vy + (_grav * _frame);
	_vel = sqrt(_vx*_vx + _vy*_vy);
	
	_y = _y + (_vy * _frame);
	_x = _x + (_vx * _frame);
};
_x