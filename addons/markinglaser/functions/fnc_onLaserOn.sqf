#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, PabstMirror
 * Starts render PFEH
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_markinglaser_fnc_onLaserOn
 *
 * Public: No
 */

if (GVAR(pfEH) != -1) exitWith {};
if (((currentVisionMode focusOn) != 1) || {EGVAR(laser,laserEmitters) isEqualTo []}) exitWith {};

GVAR(pfEH) = [LINKFUNC(renderPFH), 0, []] call CBA_fnc_addPerFrameHandler;
TRACE_1("start PFEH",GVAR(pfEH));
