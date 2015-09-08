// by commy2
#include "script_component.hpp"

params ["_unit", "_damage"];

_unit setHitPointDamage ["HitLeftLeg", (_unit getHitPointDamage "HitLeftLeg") + _damage];
_unit setHitPointDamage ["HitRightLeg", (_unit getHitPointDamage "HitRightLeg") + _damage];

systemChat format ["falling: %1", _this];
