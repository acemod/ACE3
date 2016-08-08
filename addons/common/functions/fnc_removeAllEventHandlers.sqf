#include "script_component.hpp"

params ["_eventName"];

private _newName = getText (configFile >> "ACE_newEvents" >> _eventName);
if (_newName != "") then {
    TRACE_2("Switching Names",_eventName,_newName);
    _eventName = _newName;
};

CBA_events_eventNamespace setVariable [_eventName,nil];
CBA_events_eventHashes setVariable [_eventName,nil];

ACE_DEPRECATED("ace_common_fnc_removeAllEventHandlers","3.8.0","N/A (remove events individually w/ CBA_fnc_removeEventHandler)");
