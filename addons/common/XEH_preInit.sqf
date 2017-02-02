// by commy2
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(syncedEvents) = [] call CBA_fnc_hashCreate;
GVAR(showHudHash) = [] call CBA_fnc_hashCreate;

GVAR(settingsInitFinished) = false;
GVAR(runAtSettingsInitialized) = [];

// @todo: Generic local-managed global-synced objects (createVehicleLocal)

//Debug
ACE_COUNTERS = [];

// Load settings on the server and broadcast them
if (isServer) then {
    call FUNC(loadSettingsOnServer);
};

GVAR(statusEffect_Names) = [];
GVAR(statusEffect_isGlobal) = [];

GVAR(setHearingCapabilityMap) = [];

//////////////////////////////////////////////////
// Set up PlayerChanged eventhandler for pre init (EH is installed in postInit)
//////////////////////////////////////////////////

ACE_player = objNull;
uiNamespace setVariable ["ACE_player", objNull];

// Init toHex
[0] call FUNC(toHex);

isHC = !hasInterface && !isDedicated; // deprecated because no tag
missionNamespace setVariable ["ACE_isHC", ACE_isHC];
uiNamespace setVariable ["ACE_isHC", ACE_isHC];

ADDON = true;
