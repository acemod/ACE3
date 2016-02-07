/*
 * Author: Jonpas
 * Registers connected Headless Client for use.
 *
 * Arguments:
 * 0: Headless Client <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [headlessClient] call ace_headless_handleConnectHC;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_headlessClient"];

// Delay until settings are initialized (for checking if HC trasnferring is enabled)
if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(handleConnectHC), _this];
};

// Exit if HC transferring disabled or HC already registered
if (!GVAR(Enabled) || {_headlessClient in GVAR(headlessClients)}) exitWith {};

// Register for use
GVAR(headlessClients) pushBack _headlessClient;

if (GVAR(Log)) then {
    ACE_LOGINFO_1("Registered HC: %1",_headlessClient);
};

// Rebalance
[true] call FUNC(rebalance);
