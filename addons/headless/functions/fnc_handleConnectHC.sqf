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

// Exit if already registered
if (_headlessClient in GVAR(headlessClients)) exitWith {};

// Register for use
GVAR(headlessClients) pushBack _headlessClient;

if (GVAR(Log)) then {
    ACE_LOGINFO_1("Registered HC: %1",_headlessClient);
};

// Rebalance
[true] call FUNC(rebalance);
