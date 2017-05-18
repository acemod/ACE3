/*
 * Author: GitHawk
 * Adds all magazines of a vehicle to the supply.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Vehicle or Vehicle class <OBJECT/STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, tank] call ace_rearm_fnc_addVehicleMagazinesToSupply
 * [ammo_truck, "B_MBT_01_arty_F"] call ace_rearm_fnc_addVehicleMagazinesToSupply
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_truck", objNull, [objNull]],
    ["_vehicle", objNull, [objNull, ""]]
];

if (isNull _truck ||
    {_vehicle isEqualType objNull}) exitWith {};

private _string = [_vehicle, typeOf _vehicle] select (_vehicle isEqualType objNull);
if (_string == "") exitWith {
    ERROR_1("_string [%1] is empty in ace_rearm_fnc_addVehicleMagazinesToSupply",_string);
};
{
    private _turretPath = _x;
    private _magazines = [_string, _turretPath] call FUNC(getConfigMagazines);
    {
        [_truck, _x] call FUNC(addMagazineToSupply);
        false
    } count _magazines;
    false
} count REARM_TURRET_PATHS;
