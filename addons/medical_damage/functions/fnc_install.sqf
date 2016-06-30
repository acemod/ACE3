#include "script_component.hpp"

params ["_unit"];

_unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];
