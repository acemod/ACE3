#include "script_component.hpp"

params ["_eventName", "_eventTargets", "_eventArgs"];

private _newName = getText (configFile >> "ACE_newEvents" >> _eventName);
if (_newName != "") then {
    TRACE_2("Switching Names",_eventName,_newName);
    _eventName = _newName;
};

[_eventName, _eventArgs, _eventTargets] call CBA_fnc_targetEvent;

ACE_DEPRECATED("ace_common_fnc_objectEvent","3.8.0","CBA_fnc_targetEvent");
