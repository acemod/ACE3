/*
 * Author: BaerMitUmlaut
 * Switches the generator of any aircraft on or off.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo] call ace_cockpit_interaction_fnc_switchGenerator
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

_vehicle setVariable [QGVAR(generatorOn), !(_vehicle getVariable [QGVAR(generatorOn), false]), true];
[_vehicle] call FUNC(updateElectricalPower);
