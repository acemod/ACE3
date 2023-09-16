#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * waitAndExecute Handler for periodic NVG assignment.
 *
 * Arguments:
 * None

 * Return Value:
 * None
 *
 * Example:
 * [] call ace_ai_fnc_assignNVGpfh
 *
 * Public: No
 */
TRACE_1("assignNVGpfh",count allUnits);

if (!GVAR(assignNVG)) exitWith { TRACE_1("shutdown loop",_this); GVAR(assignNVGthread) = false; };

GVAR(assignNVGstate) = sunOrMoon < 1 || {moonIntensity > 0.8};

{
    _x call FUNC(assignNVG);
} forEach allUnits;

[FUNC(assignNVGpfh), [], 300] call CBA_fnc_waitAndExecute;
