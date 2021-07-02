#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Checks hitpoint damage and determines if a vehicle should cookoff.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Chance of detonation <NUMBER>
 * 2: Vehicle ammo array <ARRAY>
 * 3: How much explosive ammo is inside vehicle <NUMBER>
 * 4: How much non-explosive ammo inside vehicle <NUMBER>
 * 5: Person who instigated damage <OBJECT> (default: objNull)
 *
 * Return Value:
 * Detonated <BOOL>
 *
 * Example:
 * [tank2, 0.5] call ace_vehicle_damage_fnc_handleDetonation;
 *
 * Public: No
 */

params ["_vehicle", "_chanceOfDetonate", "_vehicleAmmo", "_explosiveAmmoCount", "_nonExplosiveAmmoCount", ["_injurer", objNull]];
private _alreadyDetonating = _vehicle getVariable [QGVAR(detonating), false];
private _isKnockedOut = _explosiveAmmoCount > 0;

if (!_alreadyDetonating && { _chanceOfDetonate >= random 1 }) exitWith {
    [_vehicle, _injurer, _vehicleAmmo] call FUNC(detonate);
    LOG_2("Detonating [%1] with a chance-to-detonate [%2]",_vehicle,_chanceOfDetonate);
    _vehicle setVariable [QGVAR(detonating), true];
    _isKnockedOut
};

// Avoid RPT spam
if (_alreadyDetonating) exitWith { _isKnockedOut };

LOG_2("[%1] No Detonation - Chance of detonation [%2]",_vehicle,_chanceOfDetonate);
false
