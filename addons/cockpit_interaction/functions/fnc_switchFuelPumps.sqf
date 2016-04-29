/*
 * Author: BaerMitUmlaut
 * Switches the fuel pumps of any aircraft on or off.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo] call ace_cockpit_interaction_fnc_switchFuelPumps
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

if (_vehicle getVariable [QGVAR(fuelPumpsOn), false]) then {
    if (isEngineOn _vehicle) then {
        [QGVAR(setEngineOn), _vehicle, [_vehicle, false]] call EFUNC(common,objectEvent);
        [_vehicle] call FUNC(updateElectricalPower);
        // TODO: add engine damage?
    };
    _vehicle setVariable [QGVAR(fuelPumpsOn), false, true];
} else {
    _vehicle setVariable [QGVAR(fuelPumpsOn), true, true];
};
