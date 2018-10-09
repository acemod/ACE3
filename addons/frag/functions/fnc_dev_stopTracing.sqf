#include "script_component.hpp"
/*
 * Author: ACE-Team
 * Dev things
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 */

if (!GVAR(tracesStarted)) exitWith {};

INFO("Ending Trace Drawing");

GVAR(tracesStarted) = false;
[GVAR(traceID)] call CBA_fnc_removePerFrameHandler;
