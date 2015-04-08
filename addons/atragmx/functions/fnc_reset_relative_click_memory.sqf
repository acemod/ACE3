#include "script_component.hpp"

(GVAR(workingMemory) select GVAR(currentTarget)) set [10, 0];
(GVAR(workingMemory) select GVAR(currentTarget)) set [11, 0];

[] call FUNC(update_result);
