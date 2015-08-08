/*
 * Author: commy2
 *
 * Execute all Persistent Functions
 *
 * Arguments:
 * None
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target"];

{
    if (isNil "_x") then {
        diag_log text format ["[ACE] ERROR: No Arguments and function for remote function. ID: %1", _forEachIndex];
    } else {
        if (typeName _x == "ARRAY") then {
            _x params ["_args","_function"];
            [_args, _target] call _function;
        };
    };
} forEach (_target getVariable ["ACE_PersistentFunctions", []]);
