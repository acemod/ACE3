#include "script_component.hpp"

[] call FUNC(parse_input);

GVAR(ATragMX_currentScopeUnit) set [GVAR(ATragMX_currentTarget), ((GVAR(ATragMX_currentScopeUnit) select GVAR(ATragMX_currentTarget)) + 1) % (count GVAR(ATragMX_scopeUnits))];

[] call FUNC(update_scope_unit);
[] call FUNC(update_result);
