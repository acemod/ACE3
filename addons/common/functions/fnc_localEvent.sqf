/*
 * Author: Nou
 *
 * Execute a local event on this client only.
 *
 * Arguments:
 * 0: Event name (string)
 * 1: Event args (any)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_eventName", "_eventArgs"];

GVAR(events) params ["_eventNames", "_eventArray"];

private "_eventIndex";
_eventIndex = _eventNames find _eventName;

if (_eventIndex != -1) then {
    private "_events";
    _events = _eventArray select _eventIndex;

    #ifdef DEBUG_EVENTS
        ACE_LOGINFO_1("* Local Event: %1",_eventName);
        ACE_LOGINFO_1("    args=%1",_eventArgs);
    #endif

    {
        if (!isNil "_x") then {
            _eventArgs call CALLSTACK_NAMED(_x,FORMAT_2("Local Event %1 ID: %2",_eventName,_forEachIndex));

            #ifdef DEBUG_EVENTS_CALLSTACK
                ACE_LOGINFO_1("    ID: %1",_forEachIndex);
            #endif
        };
    } forEach _events;
};
