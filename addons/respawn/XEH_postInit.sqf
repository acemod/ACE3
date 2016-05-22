// by commy2
#include "script_component.hpp"

["rallypointMoved", {_this call FUNC(updateRallypoint)}] call CBA_fnc_addEventHandler;
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler; // hide enemy rallypoint markers
