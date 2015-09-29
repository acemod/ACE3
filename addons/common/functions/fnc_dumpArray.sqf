/*
 * Author: ?
 * ?
 *
 * Arguments:
 * 0: Array to be dumped <ARRAY>
 * 1: Depth <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_var", "_depth"];

private "_pad";
_pad = "";

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
    diag_log text format ["%1%2", _pad, [_var] call FUNC(formatVar)];
};
