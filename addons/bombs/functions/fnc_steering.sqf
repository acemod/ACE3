#include "script_component.hpp"

params ["_projectile", "_vector"];

private _l = sqrt ((_vector select 0) ^ 2 + (_vector select 1) ^ 2);
private _r = -(_vector select 2) / _l;

_projectile setVectorDirAndUp [ _vector, [(_vector select 0) * _r,(_vector select 1) * _r, _l] ];
//_projectile setVelocity (_vector vectorMultiply (vectorMagnitude (velocity _projectile)));