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

if (diag_frameno != GVAR(nextFrameNo)) then {
    GVAR(nextFrameBufferA) pushBack [_params, _func];
} else {
    GVAR(nextFrameBufferB) pushBack [_params, _func];
};
