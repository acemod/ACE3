#include "script_component.hpp"

(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [10, (cse_ab_ATragMX_elevationOutput select cse_ab_ATragMX_currentTarget)];
(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [11, (cse_ab_ATragMX_windageOutput select cse_ab_ATragMX_currentTarget)];

call cse_ab_ATragMX_fnc_update_result;
