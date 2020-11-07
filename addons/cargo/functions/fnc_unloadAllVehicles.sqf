#include "script_component.hpp"
/*
 * Author: Vdauphin
 * Unload all vehicles but not ACE Cargo.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Loaded vehicles not part of ACE Cargo <ARRAY>
 *
 * Example:
 * [vehicle player] call ace_cargo_fnc_unloadAllVehicles
 *
 * Public: No
 */

params ["_vehicle"];

private _loadedVehicles = [_vehicle] call ace_cargo_fnc_getVehicleCargo;
private _unloadingInterval = getNumber (configOf _vehicle >> "VehicleTransport" >> "Carrier" >> "unloadingInterval");
{
    [{objnull setVehicleCargo _this}, _x, _forEachIndex * _unloadingInterval] call CBA_fnc_waitAndExecute;
} forEach _loadedVehicles;

_loadedVehicles
