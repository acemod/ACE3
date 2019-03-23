#include "script_component.hpp"
/*
 * Author: ACE-Team
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_dev_startTracing
 *
 * Public: No
 */

if (GVAR(tracesStarted)) exitWith {};

INFO("Starting Trace Drawing");

GVAR(tracesStarted) = true;
GVAR(traceID) = [LINKFUNC(dev_drawTraces), 0, []] call CBA_fnc_addPerFrameHandler;
