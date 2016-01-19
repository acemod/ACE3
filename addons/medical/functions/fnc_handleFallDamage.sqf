// by commy2
#include "script_component.hpp"

params ["_unit", "_newDamage"];

private ["_totalDamageL", "_totalDamageR"];

_totalDamageL = (_unit getHitPointDamage "HitLeftLeg") + _newDamage;
_totalDamageR = (_unit getHitPointDamage "HitRightLeg") + _newDamage;

_unit setHitPointDamage ["HitLeftLeg", _totalDamageL];
_unit setHitPointDamage ["HitRightLeg", _totalDamageR];

systemChat format ["falling: %1", _this];
