/*
 * Author: SilentSpike
 * Enter/exit spectator mode for the local player
 * Handles the UI and camera, acts independent of player entity
 *
 * Client will be able to communicate in ACRE/TFAR as appropriate
 *
 * Arguments:
 * 0: Spectator state of local client <BOOL> (default: true)
 * 1: Force interface <BOOL> (default: true)
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [true] call ace_spectator_fnc_setSpectator
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_set",true,[true]], ["_force",true,[true]]];

// Only clients can be spectators
if !(hasInterface) exitWith {};

// Let the display know if it is or isn't forced
// Could be switched after spectator has already started
GVAR(uiForced) = _force;

// Exit if no change
if (_set isEqualTo GVAR(isSet)) exitWith {};

// Delay if local player (must not be ACE_Player) is not fully initalized
if (isNil { player } || { isNull player }) exitWith {
    [
        { !isNil { player } && { !isNull player } },
        FUNC(setSpectator),
        _this
    ] call CBA_fnc_waitUntilAndExecute;
};

// Handle common addon audio
if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {
    EGVAR(hearing,disableVolumeUpdate) = _set;
    EGVAR(hearing,deafnessDV) = 0;
};
if (["acre_sys_radio"] call EFUNC(common,isModLoaded)) then {[_set] call acre_api_fnc_setSpectator};
if (["task_force_radio"] call EFUNC(common,isModLoaded)) then {[player, _set] call TFAR_fnc_forceSpectator};

if (_set) then {
    // Initalize the camera
    [true] call FUNC(cam);

    // Create the display when main display is ready
    [{ !isNull MAIN_DISPLAY },{ [true] call FUNC(ui) }] call CBA_fnc_waitUntilAndExecute;

    // Cache current channel to switch back to on exit
    GVAR(channelCache) = currentChannel;

    // Channel index starts count after the 5 default channels
    GVAR(channel) radioChannelAdd [player];
    setCurrentChannel (5 + GVAR(channel));

    // Cache and disable nametag settings
    if (["ace_nametags"] call EFUNC(common,isModLoaded)) then {
        GVAR(nametagSettingCache) = [EGVAR(nametags,showPlayerNames), EGVAR(nametags,showNamesForAI)];
        EGVAR(nametags,showPlayerNames) = 0;
        EGVAR(nametags,showNamesForAI) = false;
    };
} else {
    // Kill the display (ensure main display exists, handles edge case where spectator turned off before display exists)
    [{ !isNull MAIN_DISPLAY },{ [false] call FUNC(ui) }] call CBA_fnc_waitUntilAndExecute;

    // This variable doesn't matter anymore
    GVAR(uiForced) = nil;

    // Terminate camera
    [false] call FUNC(cam);

    // Remove from spectator chat
    GVAR(channel) radioChannelRemove [player];

    // Restore cached channel and delete cache
    setCurrentChannel GVAR(channelCache);
    GVAR(channelCache) = nil;

    // Reset nametag settings
    if (["ace_nametags"] call EFUNC(common,isModLoaded)) then {
        EGVAR(nametags,showPlayerNames) = GVAR(nametagSettingCache) select 0;
        EGVAR(nametags,showNamesForAI) = GVAR(nametagSettingCache) select 1;
        GVAR(nametagSettingCache) = nil;
    };
};

// Reset interruptions
GVAR(interrupts) = [];

// Mark spectator state for reference
GVAR(isSet) = _set;
player setVariable [QGVAR(isSet), true, true];

["ace_spectatorSet", [_set, player]] call CBA_fnc_globalEvent;
