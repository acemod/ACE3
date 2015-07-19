/*
 * Author: SilentSpike
 * Maintains the spectatable unit list and updates the unit tree accordingly
 * Also updates current camera unit when status changes
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [ace_spectator_fnc_handleUnits, 10, _display] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

// Kill PFH when display is closed
if (isNull _display) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

// Remove all dead and null units from the list
[] call FUNC(updateUnits);

// Camera shouldn't stay on unit that isn't in the list
if !(GVAR(camUnit) in GVAR(unitList)) then {
    [0,objNull] call FUNC(updateCamera);
};

// Reduce overhead when unit tree is hidden
if (GVAR(showUnit) && GVAR(showInterface)) then {
    // Reduce overhead by spreading across frames
    [FUNC(handleInterface),["onUnitsUpdate",[_display]],1] call EFUNC(common,waitAndExecute);
};
