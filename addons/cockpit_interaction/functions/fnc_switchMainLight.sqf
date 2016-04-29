/*
 * Author: BaerMitUmlaut
 * Switches the main lights of any aircraft on or off.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo] call ace_cockpit_interaction_fnc_switchMainLights
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

private _mainLightsOn = _vehicle getVariable [QGVAR(mainLightsOn), false];
private _hasElectricalPower = _vehicle getVariable [QGVAR(hasElectricalPower), false];

_vehicle setVariable [QGVAR(mainLightsOn), !_mainLightsOn, true];
[QGVAR(setPilotLight), _vehicle, [_vehicle, _hasElectricalPower && !_mainLightsOn]] call EFUNC(common,objectEvent);
