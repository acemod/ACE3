#include "script_component.hpp"
if(GVAR(tracesStarted)) then {
	GVAR(tracesStarted) = false;
	[GVAR(traceID)] call FUNC(removeBISPFH);
};