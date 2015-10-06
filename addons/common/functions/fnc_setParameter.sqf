/*
 * Author: esteldunedain
 * Sets the value of an ACE_Parameter and makes it public.
 *
 * Arguments:
 * 0: Parameter name <STRING>
 * 1: Value
 *
 * Return Value:
 * None
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

params ["_name", "_value"];

// Hack to keep backward compatibility for the moment
if (typeName (missionNamespace getVariable _name) == "BOOL") then {
    if (typeName _value == "SCALAR") then {
        _value = _value > 0;
    };
};

missionNamespace setVariable [_name, _value];
publicVariable _name;
