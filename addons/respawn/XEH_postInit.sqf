// by commy2
#include "script_component.hpp"

["ace_rallypointMoved", {_this call FUNC(updateRallypoint)}] call CBA_fnc_addEventHandler;
["ace_playerChanged", {_this call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler; // hide enemy rallypoint markers
