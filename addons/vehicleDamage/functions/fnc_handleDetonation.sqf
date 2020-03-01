#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Checks hitpoint damage and determines if a vehicle should cookoff
 *
 * Arguments:
 * 0: The vehicle
 * 1: Chance of detonation
 *
 * Return Value:
 * Detonated <BOOL>
 *
 * Example:
 * [tank2, 0.5] call ace_vehicleDamage_fnc_handleDetonation;
 *
 *
 * Public: No
 */
params ["_vehicle", "_chanceOfDetonate", ["_injurer", objNull]];
private _currentVehicleAmmo = [_vehicle] call EFUNC(cookoff,getVehicleAmmo);
private _alreadyDetonating = _vehicle getVariable [QGVAR(detonating), false];

if (!_alreadyDetonating && { _chanceOfDetonate >= random 1 }) exitWith {
    [_vehicle, _injurer, _currentVehicleAmmo] call FUNC(detonate);
    LOG_2("Detonating [%1] with a chance-to-detonate [%2]",_vehicle,_chanceOfDetonate);
    _vehicle setVariable [QGVAR(detonating), true];
    true
};

// Avoid RPT spam
if (_alreadyDetonating) exitWith { true };

LOG_5("[%1] No Detonation - Chance of detonation [%2]",_vehicle,_chanceOfDetonate);
false
