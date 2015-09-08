// by commy2
#include "script_component.hpp"

params ["_unit", "_selection", "_damage"];

_unit setHit [_selection, (_unit getHit _selection) + _damage];

systemChat format ["selection damaged: %1", _this];
