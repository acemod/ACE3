/*
 * Author: Nou
 * Execute a event only on specific clients.
 *
 * Arguments:
 * 0: Event name (STRING)
 * 1: Event targets <OBJECT, ARRAY>
 * 2: Event args <ANY>
 *
 * Note: If local executor is in list of targets, event will execute with
 * network delay, and not immediatly.
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName", "_eventTargets", "_eventArgs"];

#ifdef DEBUG_EVENTS
    ACE_LOGINFO_2("* Target Event: %1 - %2",_eventName,_eventTargets);
    ACE_LOGINFO_1("    args=%1",_eventArgs);
#endif

ACEc = [_eventName, _eventTargets, _eventArgs];

if (!isServer) then {
    publicVariableServer "ACEc";
} else {
    ["ACEc", ACEc] call FUNC(_handleNetEvent);
};
