#include "script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Condition to switch to next navigation profile
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spike_midCourseTransition
 *
 * Public: No
 */
_args params ["", "", "", "", "_stateParams"];
_stateParams params ["", "", "", "","_navigationParams"];

_navigationParams params ["_state"];
_state isEqualTo STAGE_TERMINAL

