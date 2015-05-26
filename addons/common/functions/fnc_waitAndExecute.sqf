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

PARAMS_3(_func,_params,_delay);

GVAR(waitAndExecArray) pushBack [(ACE_time + _delay), _func, _params];
GVAR(waitAndExecArray) sort true;

if ((count GVAR(waitAndExecArray)) == 1) then {
    [{
        while {((count GVAR(waitAndExecArray)) > 0) && {((GVAR(waitAndExecArray) select 0) select 0) <= ACE_Time}} do {
            private ["_entry"];
            _entry = GVAR(waitAndExecArray) deleteAt 0;
            (_entry select 2) call (_entry select 1);
        };
        if ((count GVAR(waitAndExecArray)) == 0) then {
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
};
