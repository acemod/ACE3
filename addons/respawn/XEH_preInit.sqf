#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// fix, because killed EH will not get called at time before respawn EH
["CBA_loadingScreenDone", {
    if (GVAR(SavePreDeathGear) && getMissionConfigValue ["respawnDelay", 0] == 0) then {
        setPlayerRespawnTime 0.01;
    };
}] call CBA_fnc_addEventHandler;

ADDON = true;
