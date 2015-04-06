#include "script_component.hpp"

call compile preprocessFile ("\atragmx\fnc_parse_input.sqf");

GVAR(ATragMX_currentScopeUnit) set [GVAR(ATragMX_currentTarget), ((GVAR(ATragMX_currentScopeUnit) select GVAR(ATragMX_currentTarget)) + 1) % (count GVAR(ATragMX_scopeUnits))];

call compile preprocessFile ("\atragmx\fnc_update_scope_unit.sqf");
call compile preprocessFile ("\atragmx\fnc_update_result.sqf");
