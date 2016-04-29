/*
 * Author: BaerMitUmlaut
 * Disables the engine or switches the switches for AI pilots.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 * 1: Engine state <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo, true] call ace_cockpit_interaction_fnc_onEngine
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle", "_engineOn"];

if !(local _vehicle) exitWith {};

if (isPlayer driver _vehicle) then {
    if !(_vehicle getVariable [QGVAR(engineOn), false]) then {
        _vehicle engineOn false;
    };
} else {
    // Flip the switches for AI pilots
    _vehicle setVariable [QGVAR(engineOn), _engineOn, true];
    _vehicle setVariable [QGVAR(batteryOn), _engineOn, true];
    _vehicle setVariable [QGVAR(fuelPumpsOn), _engineOn, true];
    _vehicle setVariable [QGVAR(generatorOn), _engineOn, true];
    _vehicle setVariable [QGVAR(hasElectricalPower), _engineOn, true];
};
