#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Condition to switch to next navigation profile
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spike_fnc_midCourseTransition
 *
 * Public: No
 */
//IGNORE_PRIVATE_WARNING ["_args"] - from upper scope
_args params ["", "", "", "", "_stateParams"];
_stateParams params ["", "", "", "","_navigationParams"];

_navigationParams params ["_state"];
_state isEqualTo STAGE_TERMINAL
