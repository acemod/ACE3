/*
 * Author: ?
 * Dumps an array to the RPT, showing the depth of each element.
 *
 * Arguments:
 * 0: Array to be dumped <ARRAY>
 * 1: Depth <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0, [1,2], [[3]]]] call ace_common_fnc_dumpArray
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_var", ["_depth", 0, [0]]];

private _pad = "";

for "_i" from 0 to _depth do {
    _pad = _pad + toString [9];
};

_depth = _depth + 1;

if (IS_ARRAY(_var)) then {
    if (_var isEqualTo []) then {
        diag_log text format ["%1[],", _pad];
    } else {
        diag_log text format ["%1[", _pad];

        {
            [_x, _depth] call FUNC(dumpArray);
            false
        } count _var;

        diag_log text format ["%1],", _pad];
    };
} else {
    diag_log text format ["%1%2", _pad, _var];
};
