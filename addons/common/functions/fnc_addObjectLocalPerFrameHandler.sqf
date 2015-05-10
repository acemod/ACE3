/*
 * Author: jaynus
 *
 * Add a PFH to a local unit which will swap locality automatically triggering the PFH on the local machine.
 * Note, this function requires passing a function name instead of a code segment, to prevent RPT perf warning spam.
 * However, it still optionally takes code. 
 *
 * Arguments:
 * 0: The object to retain PFH locality on <object>
 * 1: The function name to execute <string, code> 
 * 2: Interval of execution in seconds <number>
 * 3: The arguments to pass for the function <array> [optiona]
 *
 * Return Value:
 * PFH handle ID locally
 *
 */
 
 #include "script_component.hpp"
PARAMS_2(_unit,_function,_interval,_arguments);

// First apply the appropriate expansion to the arguments
if(isNil "_arguments") then {
_arguments = [];
};
_arguments pushBack [_unit, _interval, _function];

if(!local _unit) exitWith {
    // Pass off execution to the owner
    ["ACE_olpfh", _arguments] call FUNC(serverEvent);
};

/// Execution of the PFH
[FUNC(objectLocalPFH), _interval, _arguments] call CBA_fnc_addPerFrameHandler; 