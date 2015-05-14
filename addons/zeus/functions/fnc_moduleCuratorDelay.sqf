/*
 * Author: SilentSpike
 * Function that delays the execution of the curator module function
 * Allows ascension and bird settings to be set by module beforehand
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

[{_this spawn DFUNC(bi_moduleCurator);},_this] call EFUNC(common,execNextFrame);
