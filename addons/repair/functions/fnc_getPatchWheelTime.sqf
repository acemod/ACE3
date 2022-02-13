#include "script_component.hpp"

params ["_unit", "_vehicle", "_hitPoint"];

// get current hitpoint damage
private _hitPointDamage = (_vehicle getHitPointDamage _hitPoint) - 0.35;

(_hitPointDamage / 0.05) * GVAR(patchWheelTime)
