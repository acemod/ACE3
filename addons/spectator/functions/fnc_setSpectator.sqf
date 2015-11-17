/*
 * Author: SilentSpike
 * Sets local client to the given spectator state (virtually)
 * To physically handle a spectator see ace_spectator_fnc_stageSpectator
 *
 * Client will be able to communicate in ACRE/TFAR as appropriate
 * The spectator interface will be opened/closed
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
if (!hasInterface) exitWith {};

// Exit if no change
if (_set isEqualTo GVAR(isSet)) exitwith {};

// Handle common addon audio
if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {
    EGVAR(hearing,disableVolumeUpdate) = _set;
    EGVAR(hearing,deafnessDV) = 0;
};
if (["acre_sys_radio"] call EFUNC(common,isModLoaded)) then {[_set] call acre_api_fnc_setSpectator};
if (["task_force_radio"] call EFUNC(common,isModLoaded)) then {[player, _set] call TFAR_fnc_forceSpectator};

if (_set) then {
    // Initalize camera variables
    GVAR(camBoom) = 0;
    GVAR(camDolly) = [0,0];
    GVAR(camGun) = false;

    // Initalize display variables
    GVAR(ctrlKey) = false;
    GVAR(heldKeys) = [];
    GVAR(heldKeys) resize 255;
    GVAR(mouse) = [false,false];
    GVAR(mousePos) = [0.5,0.5];

    // Update units before opening to support pre-set camera unit
    [] call FUNC(updateUnits);

    // Initalize the camera objects
    GVAR(freeCamera) = "Camera" camCreate (ASLtoATL GVAR(camPos));
    GVAR(unitCamera) = "Camera" camCreate [0,0,0];
    GVAR(targetCamera) = "Camera" camCreate [0,0,0];

    // Initalize view
    GVAR(unitCamera) camSetTarget GVAR(targetCamera);
    GVAR(unitCamera) camCommit 0;
    [] call FUNC(transitionCamera);

    // Close map and clear radio
    openMap [false,false];
    clearRadio;

    // Disable BI damage effects
    BIS_fnc_feedback_allowPP = false;

    // Close any open dialogs
    while {dialog} do {
        closeDialog 0;
    };

    [{
        // Create the display
        (findDisplay 46) createDisplay QGVAR(interface);

        // If not forced, make esc end spectator
        if (_this) then {
            (findDisplay 12249) displayAddEventHandler ["KeyDown", {
                if (_this select 1 == 1) then {
                    [false] call ace_spectator_fnc_setSpectator;
                    true
                };
            }];
        };
    }, !_force] call EFUNC(common,execNextFrame);

    // Cache and disable nametag settings
    if (["ace_nametags"] call EFUNC(common,isModLoaded)) then {
        GVAR(nametagSettingCache) = [EGVAR(nametags,showPlayerNames), EGVAR(nametags,showNamesForAI)];
        EGVAR(nametags,showPlayerNames) = 0;
        EGVAR(nametags,showNamesForAI) = false;
    };
} else {
    // Close any open dialogs (could be interrupts)
    while {dialog} do {
        closeDialog 0;
    };

    // Kill the display
    (findDisplay 12249) closeDisplay 0;

    // Terminate camera
    GVAR(freeCamera) cameraEffect ["terminate", "back"];
    camDestroy GVAR(freeCamera);
    camDestroy GVAR(unitCamera);
    camDestroy GVAR(targetCamera);

    clearRadio;

    // Return to player view
    player switchCamera "internal";

    // Enable BI damage effects
    BIS_fnc_feedback_allowPP = true;

    // Cleanup camera variables
    GVAR(camBoom) = nil;
    GVAR(camDolly) = nil;
    GVAR(camGun) = nil;
    GVAR(freeCamera) = nil;
    GVAR(unitCamera) = nil;
    GVAR(targetCamera) = nil;

    // Cleanup display variables
    GVAR(ctrlKey) = nil;
    GVAR(heldKeys) = nil;
    GVAR(mouse) = nil;
    GVAR(mousePos) = nil;

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

["spectatorSet",[_set]] call EFUNC(common,localEvent);
