/*
 * Author: jaynus
 *
 * Send a request to synchronize an event name from the client->server. Execute on client only.
 *
 * Argument:
 * 0: eventName (String)
 *
 * Return value:
 * Boolean of success
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_eventName"];

// Only JIP machines on initialization send this off, requesting sync on events with the serverCommand
if(isServer) exitWith { false };

["SEH_s", [_eventName, ACE_player] ] call ace_common_fnc_serverEvent;