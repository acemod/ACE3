#include "script_component.hpp"
/*
 * Author: jaynus
 * Send a request to synchronize an event name from the client->server. Execute on client only.
 *
 * Arguments:
 * 0: eventName <STRING>
 *
 * Return Value:
 * Boolean of success <BOOL>
 *
 * Example:
 * ["event"] call ace_common_fnc_requestSyncedEvent
 *
 * Public: No
 */

params ["_eventName"];

// Only JIP machines on initialization send this off, requesting sync on events with the serverCommand
if (isServer) exitWith {false};

["ACEs", [_eventName, ACE_player]] call CBA_fnc_serverEvent;
