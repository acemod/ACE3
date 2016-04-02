// by commy2
#include "script_component.hpp"

["rallypointMoved", {_this call FUNC(updateRallypoint)}] call CFUNC(addEventhandler);
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call CFUNC(addEventhandler); // hide enemy rallypoint markers
