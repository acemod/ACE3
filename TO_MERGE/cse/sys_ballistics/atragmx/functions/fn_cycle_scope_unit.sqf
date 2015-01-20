#include "script_component.hpp"

call cse_ab_ATragMX_fnc_parse_input;

cse_ab_ATragMX_currentScopeUnit set [cse_ab_ATragMX_currentTarget, ((cse_ab_ATragMX_currentScopeUnit select cse_ab_ATragMX_currentTarget) + 1) % (count cse_ab_ATragMX_scopeUnits)];

call cse_ab_ATragMX_fnc_update_scope_unit;
call cse_ab_ATragMX_fnc_update_result;
