/*
 * Author: Glowbal
 * Returns an 2d array of all variables that have been set on the object
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Limiting Category (default: "") <STRING>
 *
 * Return Value:
 * Variable Data <ARRAY>
 *   0: Name <STRING>
 *   1: typeName <STRING>
 *   2: value <ANY>
 *   3: publicFlag <BOOL>
 *   4: peristentFlag <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_return", "_val"];

params ["_object", ["_category", ""]];

if (isNil QGVAR(OBJECT_VARIABLES_STORAGE) || {GVAR(OBJECT_VARIABLES_STORAGE) isEqualTo []}) exitwith { [] };

_return = [];
{
    _x params ["_name", "", "_public", "_varCategory", "", "_persitents"];
    _var = _object getVariable _name;
    if (!isNil "_var") then {
        if (_category == "" || {_category == _varCategory}) then {
            _return pushback [_name, typeName _var, _var, _public, _persitents];
        };
    };
    nil
} count GVAR(OBJECT_VARIABLES_STORAGE);

_return
