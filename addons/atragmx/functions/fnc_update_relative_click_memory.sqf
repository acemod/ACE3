#include "script_component.hpp"

(GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) set [10, (GVAR(ATragMX_elevationOutput) select GVAR(ATragMX_currentTarget))];
(GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) set [11, (GVAR(ATragMX_windageOutput) select GVAR(ATragMX_currentTarget))];

[] call FUNC(update_result);
