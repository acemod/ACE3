#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Detonates vehicle ammo and kills all inside
 *
 * Arguments:
 * 0: The vehicle
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank2] call ace_vehicleDamage_fnc_detonate;
 *
 *
 * Public: No
 */
params ["_vehicle", ["_vehicleAmmo", []]];

if (_vehicleAmmo isEqualTo []) then {
    _vehicleAmmo = [_vehicle] call EFUNC(cookoff,getVehicleAmmo);
};

([_vehicle] + _vehicleAmmo) call EFUNC(cookoff,detonateAmmunition);

if ((_vehicleAmmo select 1) > 0) then {
    {
        _x setDamage 1;
    } forEach crew _vehicle;
};
