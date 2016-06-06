/*
 * Author: GitHawk
 * Adds all magazines of a vehicle to the supply.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Vehicle <OBJECT>
 * or
 * 0: Ammo Truck <OBJECT>
 * 1: Vehicle class <STRING>
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
    {typeName _vehicle == "OBJECT" && {isNull _vehicle}}) exitWith {};

private _string = "";
if (typeName _vehicle == "OBJECT") then {
    _string = typeOf _vehicle;
};
if (typeName _vehicle == "STRING") then {
    _string = _vehicle;
};
if (_string == "") exitWith {};
{
    private _turretPath = _x;
    private _magazines = [_string, _turretPath] call FUNC(getConfigMagazines);
    {
        [_truck, _x] call FUNC(addMagazineToSupply);
        false
    } count _magazines;
    false
} count REARM_TURRET_PATHS;
