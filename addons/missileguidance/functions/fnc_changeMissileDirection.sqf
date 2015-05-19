#include "script_component.hpp"
private ["_projectile", "_v", "_l", "_r"];

_projectile = _this select 0;
_v = _this select 1;

_l = sqrt ((_v select 0) ^ 2 + (_v select 1) ^ 2);
_r = -(_v select 2) / _l;

_projectile setVectorDirAndUp [ _v, [(_v select 0) * _r,(_v select 1) * _r, _l] ];
_projectile setVelocity (_v vectorMultiply (vectorMagnitude (velocity _projectile)));