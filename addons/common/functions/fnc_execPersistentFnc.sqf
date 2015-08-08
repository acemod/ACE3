/*
 * Author: commy2
 *
 * Execute a function on every machine. Function will also be called upon JIP (postInit). The arguments are stored in (_this select 0), while the assigned namespace is stored in (_this select 1).
 *
 * Arguments:
 * 0: Function arguments (Array)
 * 1: Function to execute, has to be defined on the remote machine first (String)
 * 2: Namespace to save that variable in (Object or Namespace)
 * 3: Name. Will overwrite previously defined functions with that name (String)
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(remoteFnc) = _this;

params ["_arguments", "_function", "_unit", "_name"];
_function = call compile _function;

["Remote", [_arguments, _idPFH, _name], {params ["_args","_function","_id"]; format ["%1 call %2 id: %3", _args, _function, _id]}, false] call FUNC(log);

// execute function on every currently connected machine
[[_arguments, _unit], _idPFH, 2] call FUNC(execRemoteFnc);

// save persistent function for JIP
private ["_persistentFunctions", "_index"];

_persistentFunctions = _unit getVariable ["ACE_PersistentFunctions", []];

// find index to overwrite function with the same name, add to end otherwise
_index = count _persistentFunctions;
{
    if (_x select 2 == _name) exitWith {
        _index = _forEachIndex;
    };
} forEach _persistentFunctions;

// set new value
_persistentFunctions set [_index, [_arguments, _function, _name]];

// broadcast variable
if (typeName _unit == "NAMESPACE") then {
    ACE_PersistentFunctions = _persistentFunctions;
    publicVariable "ACE_PersistentFunctions";
} else {
    _unit setVariable ["ACE_PersistentFunctions", _persistentFunctions, true];
};
