#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

if (isServer) then {
    GVAR(headlessClients) = [];
    GVAR(inRebalance) = false;
    GVAR(endMissionCheckDelayed) = false;
    [QXGVAR(headlessClientJoined), LINKFUNC(handleConnectHC)] call CBA_fnc_addEventHandler;
};

ADDON = true;
