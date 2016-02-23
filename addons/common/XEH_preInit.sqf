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

//GVARS for execNextFrame and waitAndExec and waitUntilAndExecute
GVAR(waitAndExecArray) = [];
GVAR(nextFrameNo) = diag_frameno;
GVAR(nextFrameBufferA) = [];
GVAR(nextFrameBufferB) = [];
GVAR(waitUntilAndExecArray) = [];

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

//////////////////////////////////////////////////
// Set up PlayerChanged eventhandler for pre init
//////////////////////////////////////////////////

ACE_player = objNull;
uiNamespace setVariable ["ACE_player", objNull];

// @todo check if this can be removed
if (hasInterface) then {
    // PFH to update the ACE_player variable
    GVAR(PreInit_playerChanged_PFHID) = [{
        if !(ACE_player isEqualTo (call FUNC(player))) then {
            private _oldPlayer = ACE_player;

            ACE_player = call FUNC(player);
            uiNamespace setVariable ["ACE_player", ACE_player];

            // Raise ACE event
            ["playerChanged", [ACE_player, _oldPlayer]] call FUNC(localEvent);
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
};


//////////////////////////////////////////////////
// Time handling
//////////////////////////////////////////////////

ACE_time = diag_tickTime;
ACE_realTime = diag_tickTime;
ACE_virtualTime = diag_tickTime;
ACE_diagTime = diag_tickTime;
ACE_gameTime = time;
ACE_pausedTime = 0;
ACE_virtualPausedTime = 0;

[FUNC(timePFH), 0, []] call CBA_fnc_addPerFrameHandler;

// Init toHex
[0] call FUNC(toHex);

isHC = !hasInterface && !isDedicated; // deprecated because no tag
missionNamespace setVariable ["ACE_isHC", ACE_isHC];
uiNamespace setVariable ["ACE_isHC", ACE_isHC];

ADDON = true;
