// by commy2
#include "script_component.hpp"

params ["_unit", "_selection", "_newDamage", "_projectile"];

private "_totalDamage";
_totalDamage = (_unit getHit _selection) + _newDamage;

_unit setHit [_selection, _totalDamage];

systemChat format ["selection: %1", _this];
