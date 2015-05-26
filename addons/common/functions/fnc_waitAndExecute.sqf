/*
 * Author: esteldunedain
 *
 * Executes a code once with a given game ACE_time delay, using a PFH
 *
 * Argument:
 * 0: Code to execute (Code)
 * 1: Parameters to run the code with (Array)
 * 2: Delay in seconds before executing the code (Number)
 * 3: Interval of ACE_time in which the execution is evaluated, 0 means every frame (Number)
 *
 * Return value:
 * PFH handler ID
 */
#include "script_component.hpp"

PARAMS_4(_func,_params,_delay,_interval);

[
    {
        EXPLODE_2_PVT(_this,_params,_pfhId);
        EXPLODE_2_PVT(_params,_delayedExecParams,_startTime);
        EXPLODE_3_PVT(_delayedExecParams,_func,_funcParams,_delay);

        // Exit if the ACE_time was not reached yet
        if (ACE_time < _startTime + _delay) exitWith {};

        // Remove the PFH
        [_pfhId] call cba_fnc_removePerFrameHandler;

        // Execute the function
        _funcParams call _func;
    },
    _interval,
    [_this, ACE_time]
] call CBA_fnc_addPerFrameHandler
