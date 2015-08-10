// by commy2
#include "script_component.hpp"

["rallypointMoved", {_this call FUNC(updateRallypoint)}] call EFUNC(common,addEventhandler);
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call EFUNC(common,addEventhandler);  // hide enemy rallypoint markers
