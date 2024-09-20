#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Adds rope to vehicle inventory.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_towing_fnc_addRopeToVehicle
 *
 * Public: No
 */

if (!GVAR(addRopeToVehicleInventory)) exitWith {};
params ["_vehicle"];

if (0 == getNumber (configOf _vehicle >> QEGVAR(cargo,hasCargo))) exitWith {};

private _ropeType = ["ACE_rope6", "ACE_rope12"] select (
    -1 < ["Tank", "Wheeled_APC_F", "Truck_F"] findIf {_vehicle isKindOf _x}
);

_vehicle addItemCargoGlobal [_ropeType, 1];
