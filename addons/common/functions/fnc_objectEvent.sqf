/*
 * Author: PabstMirror
 * Execute an event where object is local.
 * If local there is no network traffic/delay (Unlike targetEvent)
 *
 * Arguments:
 * 0: Event name (STRING)
 * 1: Event target <OBJECT>
 * 2: Event args <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["doThing", vehicle player, []] call ace_common_fnc_objectEvent
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName", "_eventTarget", "_eventArgs"];

#ifdef DEBUG_EVENTS
    ACE_LOGINFO_2("* Object Event: %1 - %2",_eventName,_eventTarget);
    ACE_LOGINFO_1("    args=%1",_eventArgs);
#endif

if (local _eventTarget) then {
    [_eventName, _eventArgs] call FUNC(localEvent);
} else {
    _this call FUNC(targetEvent);
};

nil
