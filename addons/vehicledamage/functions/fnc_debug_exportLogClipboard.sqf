#include "script_component.hpp"
private["_chunks", "_logString"];
_chunks = [];

if((count _this) < 1) then {
    _logString = str GVAR(debug_log);
} else {
    _logString = _this select 0;
};

_chunks = [_logString, ";"] call CBA_fnc_split;

{
    private["_chunk"];
    _chunk = _x + ";";
    "ace_clipboard" callExtension format["%1", _chunk];
} forEach _chunks;

"ace_clipboard" callExtension "--COMPLETE--";
