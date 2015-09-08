// by commy2
#include "script_component.hpp"

params ["_unit", "_newDamage"];

private ["_totalDamage"];

_totalDamage = (_unit getHitPointDamage "HitHead") + _newDamage;

[_unit] call FUNC(addToInjuredCollection);

_unit setHitPointDamage ["HitHead", _totalDamage];

systemChat format ["drowning: %1", _this];
