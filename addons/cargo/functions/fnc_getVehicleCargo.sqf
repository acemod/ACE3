#include "script_component.hpp"
/*
 * Author: Vdauphin
 * Get vehicle in cargo.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Loaded vehicles not part of ACE Cargo <ARRAY>
 *
 * Example:
 * [vehicle player] call ace_cargo_fnc_getVehicleCargo
 *
 * Public: No
 */

params ["_vehicle"];

(getVehicleCargo _vehicle - (_vehicle getVariable [QGVAR(loaded), []])) select {
    !(_x getVariable [QGVAR(isCargoNet), false])
}
