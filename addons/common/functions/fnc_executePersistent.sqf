/*
 * Author: commy2
 * Execute all Persistent Functions
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target"];

{
    if (isNil "_x") then {
        ACE_LOGERROR_1("No arguments and function for remote function. ID: %1",_forEachIndex);
    } else {
        if (typeName _x == "ARRAY") then {
            [_x select 0, _target] call (_x select 1);
        };
    };
} forEach (_target getVariable ["ACE_PersistentFunctions", []]);
