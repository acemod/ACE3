#include "script_component.hpp"

(GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) set [10, 0];
(GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) set [11, 0];

call compile preprocessFile ("\atragmx\fnc_update_result.sqf");
