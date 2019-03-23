#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Enter/exit spectator mode for the local player
 *
 * Client will be able to communicate in ACRE/TFAR as appropriate
 * If "hide player" is true player will be hidden from group, invisible and invulnerable, but unmoved
 *
 * Arguments:
 * 0: Spectator state of local client <BOOL> (default: true)
 * 1: Force interface <BOOL> (default: true)
 * 2: Hide player (if alive) <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_spectator_fnc_setSpectator
 *
 * Public: Yes
 */

params [["_set",true,[true]], ["_force",true,[true]], ["_hide",true,[true]]];
TRACE_3("Params",_set,_force,_hide);

// Only clients can be spectators
if !(hasInterface) exitWith {};

// Let the display know if it is or isn't forced
// Could be switched after spectator has already started
GVAR(uiForced) = _force;

// Exit if no change (everything above this may need to be ran again)
if (_set isEqualTo GVAR(isSet)) exitWith {};

// Delay if local player (must not be ACE_Player) does not exist
if (isNull player) exitWith {
    [
        { !isNull player },
        FUNC(setSpectator),
        _this
    ] call CBA_fnc_waitUntilAndExecute;
};

// Remove any current deafness and disable volume updates while spectating
if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {
    EGVAR(hearing,disableVolumeUpdate) = _set;
    EGVAR(hearing,deafnessDV) = 0;
};

// Toggle spectator mode in 3rd party radio addons
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
    // Kill the display (ensure main display exists, handles edge case where spectator turned off beforehand)
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

// Hide/Unhide the player if enabled and alive
if (alive player) then {
    private _hidden = (_hide && _set);
    TRACE_1("",_hidden);

    // Ignore damage (vanilla and ace_medical)
    player allowDamage !_hidden;
    player setVariable [QEGVAR(medical,allowDamage), !_hidden];

    // Move to/from group as appropriate
    [player, _hidden, QGVAR(isSet), side group player] call EFUNC(common,switchToGroupSide);

    // Ghosts can't talk
    if (_hidden) then {
        [player, QGVAR(isSet)] call EFUNC(common,hideUnit);
        [player, QGVAR(isSet)] call EFUNC(common,muteUnit);
    } else {
        [player, QGVAR(isSet)] call EFUNC(common,unhideUnit);
        [player, QGVAR(isSet)] call EFUNC(common,unmuteUnit);
    };
};

// Reset interruptions
GVAR(interrupts) = [];

// Mark spectator state for reference
GVAR(isSet) = _set;
player setVariable [QGVAR(isSet), _set, true];

["ace_spectatorSet", [_set, player]] call CBA_fnc_globalEvent;
