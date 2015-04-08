#include "script_component.hpp"

[] call FUNC(parse_input);

GVAR(currentScopeUnit) set [GVAR(currentTarget), ((GVAR(currentScopeUnit) select GVAR(currentTarget)) + 1) % (count GVAR(scopeUnits))];

[] call FUNC(update_scope_unit);
[] call FUNC(update_result);
