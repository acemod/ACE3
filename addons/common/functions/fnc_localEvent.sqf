/*
 * Author: Nou
 *
 * Execute a local event on this client only.
 *
 * Argument:
 * 0: Event name (string)
 * 1: Event args (any)
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

_eventName = _this select 0;
_eventArgs = _this select 1;

_eventNames = GVAR(events) select 0;
_eventIndex = _eventNames find _eventName;
if(_eventIndex != -1) then {
    _events = (GVAR(events) select 1) select _eventIndex;
    {
        if(!isNil "_x") then {
            _eventArgs call CALLSTACK_NAMED(_x, format[ARR_3("Local Event %1 ID: %2",_eventName,_forEachIndex)]);
        };
    } forEach _events;
};