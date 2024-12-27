// by commy2
#include "script_component.hpp"

["ace_rallypointMoved", LINKFUNC(updateRallypoint)] call CBA_fnc_addEventHandler;
["unit", LINKFUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler; // hide enemy rallypoint markers

[QGVAR(showFriendlyFireMessageEvent), LINKFUNC(showFriendlyFireMessage)] call CBA_fnc_addEventHandler;
