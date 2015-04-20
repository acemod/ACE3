#include "script_component.hpp"

private ["_unit"];
_unit = _this select 0;

_unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];
[_unit] call FUNC(init);
