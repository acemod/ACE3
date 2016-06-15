#include "script_component.hpp"

params ["_eventName", "_eventCode"];

private _newName = getText (configFile >> "ACE_newEvents" >> _eventName);
if (_newName != "") then {
    TRACE_2("Switching Names",_eventName,_newName);
    _eventName = _newName;
};

[_eventName, _eventCode] call CBA_fnc_removeEventHandler;

ACE_DEPRECATED("ace_common_fnc_removeEventHandler","3.8.0","CBA_fnc_removeEventHandler");
