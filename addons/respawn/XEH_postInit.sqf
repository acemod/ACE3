// by commy2
#include "script_component.hpp"

["ace_rallypointMoved", FUNC(updateRallypoint)] call CBA_fnc_addEventHandler;
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler; // hide enemy rallypoint markers

[QGVAR(showFriendlyFireMessageEvent), FUNC(showFriendlyFireMessage)] call CBA_fnc_addEventHandler;
