#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Detonates vehicle ammo and heavily wounds all inside.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Person who caused detonation <OBJECT> (default: objNull)
 * 2: An array of vehicle ammo in vehicle <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank2] call ace_vehicle_damage_fnc_detonate;
 *
 * Public: No
 */

params ["_vehicle", ["_injurer", objNull], ["_vehicleAmmo", []]];

if (_vehicleAmmo isEqualTo []) then {
    _vehicleAmmo = [_vehicle] call EFUNC(cookoff,getVehicleAmmo);
};

([_vehicle] + _vehicleAmmo) call EFUNC(cookoff,detonateAmmunition);

if ((_vehicleAmmo select 1) > 0) then {
    {
        [QGVAR(medicalDamage), [_x, _injurer, _injurer], _x] call CBA_fnc_targetEvent;
    } forEach (crew _vehicle);
};
