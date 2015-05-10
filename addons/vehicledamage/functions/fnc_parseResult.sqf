//#define DEBUG_MODE_FULL

#include "script_component.hpp"
PARAMS_1(_resultString);
private["_values", "_result", "_strings", "_command", "_arguments"];
TRACE_1("", _resultString);

if( (_resultString find ":") < 0 ) exitWith { nil };

_strings = [_resultString, ":"] call CBA_fnc_split;
TRACE_1("", _strings);
// Invalid comman

// Command with no parameters
_command = _strings select 0;
if((count _strings) < 2) exitWith { [_command, []] };

if(_command == "exec") exitWith {
    _code = compile (_strings select 1);
    [_command, _code]
};

_arguments = [(_strings select 1), ","] call CBA_fnc_split;
[(_strings select 0), _arguments]