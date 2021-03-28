#include "script_component.hpp"
/*
 * Author: mharis001
 * Initializes the medical blood system based on the given mode.
 * Should only be called from the CBA setting changed script.
 *
 * Arguments:
 * 0: Mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [2] call ace_medical_blood_fnc_init
 *
 * Public: No
 */

params ["_mode"];

// Exit if setting is refreshed to the same value
if (!isNil QGVAR(currentSetup) && {_mode == GVAR(currentSetup)}) exitWith {
    TRACE_2("Setting refreshed to current setup",GVAR(currentSetup),_mode);
};

// Track this new configuration that will be set up
GVAR(currentSetup) = _mode;

// Delete current state machine if it exists
if (!isNil QGVAR(stateMachine)) then {
    GVAR(stateMachine) call CBA_statemachine_fnc_delete;
    GVAR(stateMachine) = nil;
};

// Remove wound received if it was previously added
if (!isNil QGVAR(woundReceivedEH)) then {
    [QEGVAR(medical,woundReceived), GVAR(woundReceivedEH)] call CBA_fnc_removeEventHandler;
    GVAR(woundReceivedEH) = nil;
};

// Don't need to set up anything if blood is disabled or players only on a non-player machine
if (_mode == BLOOD_DISABLED || {_mode == BLOOD_ONLY_PLAYERS && {!hasInterface}}) exitWith {
    TRACE_1("Mode does not require any setup",_mode);
};

private _listCode = if (_mode == BLOOD_ONLY_PLAYERS) then {
    // ACE_player is the only possible local player
    {
        if (alive ACE_player) then {
            [ACE_player]
        } else {
            []
        };
    }
} else {
    // Filter all local units
    EFUNC(common,getLocalUnits)
};

GVAR(stateMachine) = [_listCode, true] call CBA_statemachine_fnc_create;
[GVAR(stateMachine), LINKFUNC(onBleeding), {}, {}, "Bleeding"] call CBA_statemachine_fnc_addState;

GVAR(woundReceivedEH) = [QEGVAR(medical,woundReceived), FUNC(handleWoundReceived)] call CBA_fnc_addEventHandler;

TRACE_3("Set up state machine and wounds event",_mode,GVAR(stateMachine),GVAR(woundReceivedEH));
