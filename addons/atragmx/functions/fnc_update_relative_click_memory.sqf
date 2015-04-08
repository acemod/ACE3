#include "script_component.hpp"

(GVAR(workingMemory) select GVAR(currentTarget)) set [10, (GVAR(elevationOutput) select GVAR(currentTarget))];
(GVAR(workingMemory) select GVAR(currentTarget)) set [11, (GVAR(windageOutput) select GVAR(currentTarget))];

[] call FUNC(update_result);
