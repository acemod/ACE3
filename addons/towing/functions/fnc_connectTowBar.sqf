/*
 * Author: Jonpas
 * Connects a tow bar to a vehicle.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank, player] call ace_towing_fnc_connectTowBar
 *
 * Public: no
 */
#include "script_component.hpp"

private ["_connectingVehicle"];
params ["_target", "_unit"];

_connectingVehicle = _unit getVariable QGVAR(towConnecting);

if (isNil "_connectingVehicle") then {
    // Set connecting and temporary towing variable
    _unit setVariable [QGVAR(towConnecting), _target];
    _target setVariable [QGVAR(isTowing), true, true];
} else {
    // Remove connecting variables
    _unit setVariable [QGVAR(towConnecting), nil];

    // Set variables on both vehicles
    _target setVariable [QGVAR(isTowed), _connectingVehicle, true];
    _connectingVehicle setVariable [QGVAR(isTowing), _target, true];

    // Start towing
    [_connectingVehicle, _target] call FUNC(towVehicle);
};
