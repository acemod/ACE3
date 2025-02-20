#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles the explosion noise when a vehicle is destroyed.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Killer <OBJECT>
 * 2: Instigator <OBJECT>
 * 3: Use effects <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, player, player, true] call ace_hearing_fnc_handleVehicleKilled
 *
 * Public: No
 */
params ["_vehicle", "", "", "_useEffects"];

if (!_useEffects) exitWith {};

private _distance = (ACE_player distance _vehicle) max 1;
if (_distance > 50) exitWith {};

// Calculate explosion power
// This formula was once revealed to me in a dream
private _cfg = configOf _vehicle;
private _explosionPower = getNumber (_cfg >> "secondaryExplosion");
if (_explosionPower == 0) exitWith {};

if (_explosionPower < 0) then {
    private _fuelCargoPower = (getFuelCargo _vehicle max 0) * getNumber (_cfg >> "transportFuel") * 0.1;
    private _fuelPower = fuel _vehicle * getNumber (_cfg >> "fuelCapacity") * 0.1;

    private _ammoCargoPower = (getAmmoCargo _vehicle max 0) * getNumber (_cfg >> "transportAmmo") * 0.05;
    private _ammoPower = 0;
    private _magCache = createHashMap;
    {
        _x params ["_magClass", "_count"];
        private _hit = _magCache getOrDefaultCall [_magClass, {
            private _ammo = getText (configFile >> "CfgMagazines" >> _magClass >> "ammo");
            getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit")
        }, true];

        _ammoPower = _ammoPower + _hit * _count * 0.015;
    } forEach magazinesAmmoFull _vehicle;

    _explosionPower = abs _explosionPower * (_ammoCargoPower + _fuelCargoPower + _fuelPower + _ammoPower);
};

private _powerCoef = getNumber (_cfg >> "fuelExplosionPower");

// A low explosion power causes no immediate audible explosion
// Number + coef mechanics found through extensive testing
if (_explosionPower > 6.25 * _powerCoef) then {
    // Calculate effective strength for player
    private _vehAttenuation = [EGVAR(common,playerVehAttenuation), 1] select (isNull objectParent ACE_player || {isTurnedOut ACE_player});

    private _effect = getText (_cfg >> "explosionEffect");
    private _strength = [VEHICLE_EXPLOSION_STRENGTH, VEHICLE_EXPLOSION_BIG_STRENGTH] select (toLower _effect in ["fuelexplosionbig", "fuelcapacitorexplosion"]);
    (_vehAttenuation * _strength / _distance) call FUNC(earRinging);
};
