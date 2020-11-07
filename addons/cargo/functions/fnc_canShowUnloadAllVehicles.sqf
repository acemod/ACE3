#include "script_component.hpp"
/*
 * Author: Vdauphin
 * Checks if unload all vehicles interaction can be show.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can show menu <BOOL>
 *
 * Example:
 * [vehicle player, player] call ace_cargo_fnc_canShowUnloadAllVehicles
 *
 * Public: No
 */

params [
    "_vehicle",
    ["_unit", player, [objNull]]
];

driver _vehicle isEqualTo _unit &&
{isClass (configOf _vehicle >> "VehicleTransport" >> "Carrier")} &&
{!(getVehicleCargo _vehicle - (_vehicle getVariable [QGVAR(loaded), []]) isEqualTo [])}
