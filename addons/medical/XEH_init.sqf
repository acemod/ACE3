#include "script_component.hpp"

private ["_unit"];
_unit = _this select 0;

_unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];

if (local _unit) then {
	[_unit] call FUNC(init);
};
