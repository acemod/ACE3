//fnc_dumpArray.sqf
#include "script_component.hpp"

private ["_var", "_depth", "_pad", "_i", "_x"];

_var = _this select 0;
_depth = _this select 1;
_pad = "";
for "_i" from 0 to _depth do {
    _pad = _pad + toString [9];
};
_depth = _depth + 1;
if(IS_ARRAY(_var)) then {
    if((count _var) > 0) then {
        diag_log text format["%1[", _pad];
        {
            [_x, _depth] call FUNC(dumpArray);
        } forEach _var;
        diag_log text format["%1],", _pad];
    } else {
        diag_log text format["%1[],", _pad];
    };
} else {
    diag_log text format["%1%2", _pad, [_var] call FUNC(formatVar)];
};
