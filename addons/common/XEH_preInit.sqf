// by commy2
#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

//ACE events global variables
GVAR(eventsLocation) = createLocation ["ACE_HashLocation", [-10000,-10000,-10000], 0, 0];
GVAR(eventsLocation) setText QGVAR(eventsLocation);

// backwards comp
DFUNC(canUseWeapon) = {
    ACE_DEPRECATED("ace_common_fnc_canUseWeapon","3.7.0","CBA_fnc_canUseWeapon");
    _this call CBA_fnc_canUseWeapon;
};

DFUNC(selectWeaponMode) = {
    ACE_DEPRECATED("ace_common_fnc_selectWeaponMode","3.7.0","CBA_fnc_selectWeapon");
    _this call CBA_fnc_selectWeapon;
};

GVAR(syncedEvents) = HASH_CREATE;
GVAR(showHudHash) = [] call FUNC(hashCreate);

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
