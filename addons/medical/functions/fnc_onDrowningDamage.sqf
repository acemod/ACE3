// by commy2
#include "script_component.hpp"

params ["_unit", "_damage"];

_unit setHitPointDamage ["HitHead", (_unit getHitPointDamage "HitHead") + _damage];

systemChat format ["drowning: %1", _this];
