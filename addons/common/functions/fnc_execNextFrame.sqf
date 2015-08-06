/*
 * Author: esteldunedain
 *
 * Executes a code on the next frame
 *
 * Argument:
 * 0: Code to execute (CODE)
 * 1: Parameters to run the code with (ARRAY)
 *
 * Return value:
 * PFH handler ID (NUMBER)
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if (diag_frameno != GVAR(nextFrameNo)) then {
    GVAR(nextFrameBufferA) pushBack _this;
} else {
    GVAR(nextFrameBufferB) pushBack _this;
};
