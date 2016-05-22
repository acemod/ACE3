#include "script_component.hpp"

params ["_eventName", "_eventTarget", "_eventArgs"];

[_eventName, _eventArgs, _eventTargets] call CBA_fnc_targetEvent;

ACE_DEPRECATED("ace_common_fnc_objectEvent","3.8.0","CBA_fnc_targetEvent");
