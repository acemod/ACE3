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
 * Example:
 * [bob, ""] call ace_common_fnc_getAllDefinedSetVariables
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_object", ["_category", ""]];

if (isNil QGVAR(OBJECT_VARIABLES_STORAGE)) exitWith {[]};

private _return = [];

{
    private _val = _object getVariable (_x select 0);

    if (!isNil "_val") then {
        if (_category == "" || _category == _x select 3) then {
            _return pushBack [_x select 0, typeName _val, _val, _x select 2, _x select 5];
        };
    };
    false
} count GVAR(OBJECT_VARIABLES_STORAGE);

_return
