#include "script_component.hpp"

params ["_eventName", "_eventTargets", "_eventArgs"];

[_eventName,_eventArgs,_eventTargets] call CBA_fnc_targetEvent;

ACE_DEPRECATED("ace_common_fnc_targetEvent","3.8.0","CBA_fnc_targetEvent");
