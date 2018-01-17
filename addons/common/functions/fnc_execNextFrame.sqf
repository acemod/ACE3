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

ACE_DEPRECATED("ace_common_fnc_execNextFrame","3.8.0","CBA_fnc_execNextFrame");

_this call CBA_fnc_execNextFrame;
