/*
 * Author: BaerMitUmlaut
 * Turns the electrical power of any aircraft on or off, depending on the state of
 * the battery, engine and generator.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo] call ace_cockpit_interaction_fnc_updateElectricalPower
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

if (_vehicle getVariable [QGVAR(batteryOn), false] || {(isEngineOn _vehicle) && {_vehicle getVariable [QGVAR(generatorOn), false]}}) then {
    _vehicle setVariable [QGVAR(hasElectricalPower), true, true];
    if (_vehicle getVariable [QGVAR(collisionLightsOn), false]) then {
        [QGVAR(setCollisionLight), _vehicle, [_vehicle, true]] call EFUNC(common,objectEvent);
    };
    if (_vehicle getVariable [QGVAR(mainLightsOn), false]) then {
        [QGVAR(setPilotLight), _vehicle, [_vehicle, true]] call EFUNC(common,objectEvent);
    };
    if (_vehicle getVariable [QGVAR(starterOn), false]) then {
        [_vehicle] call FUNC(switchStarterInternal);
    };
} else {
    _vehicle setVariable [QGVAR(hasElectricalPower), false, true];
    [QGVAR(simulatePowerLoss), _vehicle, [_vehicle]] call EFUNC(common,objectEvent);
    if (_vehicle getVariable [QGVAR(starterOn), false]) then {
        [_vehicle] call FUNC(switchStarterInternal);
    };
};
