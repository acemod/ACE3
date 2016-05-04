/*
 * Author: esteldunedain
 * Executes a code on the next frame
 *
 * Arguments:
 * 0: Code to execute <CODE>
 * 1: Parameters to run the code with <ARRAY>
 *
 * Return Value:
 * PFH handler ID <NUMBER>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_func", "_params"];

if (diag_frameno != GVAR(nextFrameNo)) then {
    GVAR(nextFrameBufferA) pushBack [_params, _func];
} else {
    GVAR(nextFrameBufferB) pushBack [_params, _func];
};
