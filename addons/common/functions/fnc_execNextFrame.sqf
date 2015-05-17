/*
 * Author: esteldunedain
 *
 * Executes a code on the next frame
 *
 * Argument:
 * 0: Code to execute (Code)
 * 1: Parameters to run the code with (Array)
 *
 * Return value:
 * PFH handler ID
 */
#include "script_component.hpp"

PARAMS_2(_func,_params);

[
    {
        EXPLODE_2_PVT(_this,_params,_pfhId);
        EXPLODE_2_PVT(_params,_delayedExecParams,_startFrame);
        EXPLODE_2_PVT(_delayedExecParams,_func,_funcParams);

        // Exit if we are still on the same frame
        if (diag_frameno == _startFrame) exitWith {};

        // Remove the PFH
        [_pfhId] call cba_fnc_removePerFrameHandler;

        // Execute the function
        _funcParams call _func;
    },
    0,
    [_this, diag_frameno]
] call CBA_fnc_addPerFrameHandler
