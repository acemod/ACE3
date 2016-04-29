/*
 * Author: BaerMitUmlaut
 * Switches the battery of any aircraft on or off.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo] call ace_cockpit_interaction_fnc_switchBattery
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

_vehicle setVariable [QGVAR(batteryOn), !(_vehicle getVariable [QGVAR(batteryOn), false]), true];
[_vehicle] call FUNC(updateElectricalPower);
