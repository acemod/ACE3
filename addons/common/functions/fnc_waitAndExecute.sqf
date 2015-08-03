/*
 * Author: esteldunedain
 *
 * Executes a code once with a given game ACE_time delay, using a PFH
 *
 * Argument:
 * 0: Code to execute (Code)
 * 1: Parameters to run the code with (Array)
 * 2: Delay in seconds before executing the code (Number)
 *
 * Return value:
 * None
 *
 * Example:
 * [{(_this select 0) setVelocity [0,0,200];}, [player], 10] call ace_common_fnc_waitAndExecute
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_func", "_params", "_delay"];

GVAR(waitAndExecArray) pushBack [(ACE_time + _delay), _func, _params];
GVAR(waitAndExecArray) sort true;
