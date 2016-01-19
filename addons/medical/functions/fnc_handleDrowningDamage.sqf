// by commy2
#include "script_component.hpp"

params ["_unit", "_newDamage"];

private ["_selection", "_totalDamage"];

_selection = "head";

_totalDamage = (_unit getHit _selection) + _newDamage;

_unit setHit [_selection, _totalDamage];

systemChat format ["drowning: %1", _this];
