#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Sets the value of an ACE_Parameter and makes it public.
 *
 * Arguments:
 * 0: Parameter name <STRING>
 * 1: Value <BOOL, NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Name", 5] call ace_common_fnc_setParameter
 *
 * Public: Yes
 *
 * Deprecated
 */

params ["_name", "_value"];

// Hack to keep backward compatibility for the moment
if (typeName (missionNamespace getVariable _name) == "BOOL") then {
    if (_value isEqualType 0) then {
        _value = _value > 0;
    };
};

missionNamespace setVariable [_name, _value];
publicVariable _name;
