/*
 * Author: PabstMirror
 * Gets all magazines inside of a vehicle.
 *
 * Arguments:
 * 0: Vehicle <Object>
 *
 * Return Value:
 * 0: Ammo Array <ARRAY>
 *      0: Magazine Classname <STRING>
 *      1: Ammo Count <NUMBER>
 * 1: Total Ammo Count <NUMBER>
 *
 * Example:
 * [vehicle player] call ace_cookoff_fnc_getVehicleAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("getVehicleAmmo",_vehicle);

private _ammoToDetonate = [];
private _totalAmmo = 0;

// Get ammo from turrets
{
    _x params ["_mag", "", "_count"];
    if (_count > 0) then {
        _ammoToDetonate pushBack [_mag, _count];
        _totalAmmo = _totalAmmo + _count;
    };
} forEach (magazinesAllTurrets _vehicle);

// Get ammo from cargo space
{
    _x params ["_mag", "_count"];
    if (_count > 0) then {
        _ammoToDetonate pushBack [_mag, _count];
        _totalAmmo = _totalAmmo + _count;
    };
} forEach (magazinesAmmoCargo  _vehicle);

// Get ammo from transportAmmo / ace_rearm
private _vehCfg = configFile >> "CfgVehicles" >> typeOf _vehicle;
if (((getNumber (_vehCfg >> "transportAmmo")) > 1000) || {isClass (_vehCfg >> "ACE_Actions" >> "ACE_MainActions" >> QEGVAR(rearm,TakeAmmo))}) then {
    TRACE_1("transportAmmo vehicle - adding virtual ammo",typeOf _vehicle);

    _ammoToDetonate pushBack ["2000Rnd_65x39_belt", 2000];
    _totalAmmo = _totalAmmo + 2000;
    _ammoToDetonate pushBack ["20Rnd_105mm_HEAT_MP", 100];
    _totalAmmo = _totalAmmo + 100;
};

[_ammoToDetonate, _totalAmmo]
