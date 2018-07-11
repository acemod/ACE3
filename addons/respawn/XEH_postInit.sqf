#include "script_component.hpp"

["ace_rallypointMoved", FUNC(updateRallypoint)] call CBA_fnc_addEventHandler;
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler; // hide enemy rallypoint markers

[QGVAR(showFriendlyFireMessageEvent), FUNC(showFriendlyFireMessage)] call CBA_fnc_addEventHandler;

// fix, because killed EH will not get called at time before respawn EH
if (GVAR(SavePreDeathGear) && getMissionConfigValue ["respawnDelay", 0] == 0) then {
    ["CBA_loadingScreenDone", {setPlayerRespawnTime 0.01}] call CBA_fnc_addEventHandler;
};
