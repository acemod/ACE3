/*
 * Author: jaynus
 *
 *
 * Argument:
 * 
 * Return value:
 * Boolean of success
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"
PARAMS_1(_eventName);

// Only JIP machines on initialization send this off, requesting sync on events with the serverCommand
if(isServer) exitWith { false };

["SEH_s", [_eventName, ACE_player] ] call ace_common_fnc_serverEvent;