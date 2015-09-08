// by commy2
#include "script_component.hpp"

params ["_unit", "_damage"];

_unit setHitPointDamage ["HitBody", (_unit getHitPointDamage "HitBody") + _damage];

systemChat format ["collision: %1", _this];
