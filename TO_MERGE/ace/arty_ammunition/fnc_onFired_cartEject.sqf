//#define DEBUG_MODE_FULL
#include "script_component.hpp"
/*
private["_gun", "_cartridge", "_speed", "_dir", "_vel"];
TRACE_1("", _this);
_gun = _this select 0;

// check to see if ACE cart is enabled
// if(!ace_sys_cartridges_enabled) exitWith { false };

// find the back of the gun and spawn the cartridge locally behind it

_cartridge = "ace_arty_m14_casing" createVehicleLocal (getPos _gun);
_cartridge setPos ( _gun modelToWorld [0,-1.3,1.1]);

_cartridge setDir (getDir _gun);
_vel = velocity _cartridge;
_dir = abs ((getDir _gun) + 180 + (-15+(random 30)) % 360);
_speed = 4;

_cartridge setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];
_vel = velocity _cartridge;
TRACE_5("", _dir, _vel, _speed, _cartridge, _gun);

// add to cleanup FIFO?
[_cartridge, 300] call ACE_fnc_add2fifo;
*/