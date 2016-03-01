/*
 * Author: Jonpas
 * Removes Headless Client from use.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Transfer To Server <BOOL>
 *
 * Example:
 * [unit] call ace_headless_handleDisconnect;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

// Exit if not HC
if !(_object in GVAR(headlessClients)) exitWith {};

// Remove HC
GVAR(headlessClients) deleteAt (GVAR(headlessClients) find _object);

if (GVAR(Log)) then {
    ACE_LOGINFO_1("Removed HC: %1",_object);
};

// Rebalance
[true] call FUNC(rebalance);

// Prevent transferring of HC to server
false
