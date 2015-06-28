#include "script_component.hpp"

PARAMS_1(_wire);
_wire addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];