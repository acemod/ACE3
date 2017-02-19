#include "script_component.hpp"
params ["_wire"];
_wire addEventHandler ["HandleDamage", {call FUNC(handleDamage)}];
