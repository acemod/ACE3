/*
 * Author: BaerMitUmlaut
 * Switches the turbine starter switch of any aircraft on or off.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo] call ace_cockpit_interaction_fnc_switchStarter
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

private _starterOn = _vehicle getVariable [QGVAR(starterOn), false];
if (!_starterOn && {_vehicle getVariable [QGVAR(hasElectricalPower), false]}) then {
    [_vehicle] call FUNC(switchStarterInternal);
};
_vehicle setVariable [QGVAR(starterOn), !_starterOn, true];
