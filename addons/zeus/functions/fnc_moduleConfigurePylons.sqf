/*
 * Author: 654wak654
 * Opens the pylon configuration menu for the aircraft module is placed on.
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleConfigurePylons
 *
 * Public: No
 */
#include "script_component.hpp"

if (canSuspend) exitWith {[FUNC(moduleConfigurePylons), _this] call CBA_fnc_directCall;};

params ["_logic"];

if !(local _logic) exitWith {};

private _aircraft = attachedTo _logic;

deleteVehicle _logic;

if (isNull _aircraft) exitWith {
    [LSTRING(NothingSelected)] call FUNC(showMessage);
};
if (!alive _aircraft) exitWith {
    [LSTRING(OnlyAlive)] call FUNC(showMessage);
};

[_aircraft, true] call EFUNC(pylons,showDialog);
