#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_eventName", "_eventArgs"];

private _newName = getText (configFile >> "ACE_newEvents" >> _eventName);
if (_newName != "") then {
    TRACE_2("Switching Names",_eventName,_newName);
    _eventName = _newName;
};

[_eventName, _eventArgs] call CBA_fnc_globalEvent;

ACE_DEPRECATED("ace_common_fnc_globalEvent","3.8.0","CBA_fnc_globalEvent");
