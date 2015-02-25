/* ace_sys_cargo | (c) 2010,2011 by rocko */

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_location);

TRACE_1("Dialog open ... list",_location);
[_location] call FUNC(view);

false