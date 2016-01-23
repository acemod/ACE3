/*
 * Author: commy2
 * Execute a function on a remote machine in mp.
 *
 * Arguments:
 * 0: Function arguments <ARRAY>
 * 1: Function to execute, has to be defined on the remote machine first <STRING>
 * 2: The function will be executed where this unit is local OR the mode were this function should be executed. (default: 2) <OBJECT, NUMBER>
 *     0 = execute on this machine only
 *     1 = execute on server
 *     2 = execute on all clients + server
 *     3 = execute on dedicated only
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Deprecated
 */
#include "script_component.hpp"

GVAR(remoteFnc) = _this;

params ["_arguments", "_function", ["_unit", 2]];
TRACE_3("params", _arguments, _function, _unit);

_function = call compile _function;

if (_unit isEqualType 0) exitWith {
    switch (_unit) do {
        case 0 : {
            _arguments call _function;
        };
        case 1 : {
            if (isServer) then {
                _arguments call _function;
            } else {
                publicVariableServer QGVAR(remoteFnc);
            };
        };
        case 2 : {
            _arguments call _function;

            GVAR(remoteFnc) set [2, 0];
            publicVariable QGVAR(remoteFnc);
        };
        case 3 : {
            if (isDedicated) then {
                _arguments call _function;
            } else {
                if (!isServer) then {publicVariableServer QGVAR(remoteFnc)};
            };
        };
    };
};

if (local _unit) then {
    _arguments call _function;
} else {
    if (isServer) then {
        (owner _unit) publicVariableClient QGVAR(remoteFnc);
    } else {
        publicVariableServer QGVAR(remoteFnc);
    };
};
