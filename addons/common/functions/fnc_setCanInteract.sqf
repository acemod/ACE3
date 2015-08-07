/*
 * Author: Glowbal
 *
 * N/A
 *
 * Argument:
 * ?
 *
 * Return value:
 * ?
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit","_to","_return"];
params[["_unit",ObjNull,[ObjNull]],"_to"];

_return = false;

if (((typeName _to) == "SCALAR")) then {
    if (_to <-1) then {
        _to = -1;
    } else {
        if (_to > 1) then {
            _to = 1;
        };
    };
    _unit setvariable [QGVAR(canInteract), ([_unit] call FUNC(getCanInteract)) + _to,false];
    _return = true;
};
_return
