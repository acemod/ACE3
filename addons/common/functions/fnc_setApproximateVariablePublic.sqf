#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Publish a variable if it's different enough from the previously published value.
 *
 * Arguments:
 * 0: Object the variable should be assigned to <OBJECT>
 * 1: Name of the variable <STRING>
 * 2: Value of the variable <ANY>
 * 3: Absolute tolerance <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "balls", 2, 0.1] call ace_common_fnc_setApproximateVariablePublic;
 *
 * Public: No
 */

params ["_object", "_varName", "_value", "_tolerance"];
TRACE_4("params",_object,_varName,_value,_tolerance);

// Set exact new value locally
_object setVariable [_varName, _value];

// Exit if in SP - "duh"
if (!isMultiplayer) exitWith {};

// If new value is not different
private _oldVarName = format ["ACE_oldValue_%1", _varName];
private _oldValue = _object getVariable [_oldVarName, -100000];

// Exit if new value is not different enough from the old onedifferent
if (abs(_value - _oldValue) < _tolerance) exitWith {};

// Publish the new value:
_object setVariable [_varName, _value, true];
_object setVariable [_oldVarName, _value];

TRACE_2("Published variable:", _varName, _value);
