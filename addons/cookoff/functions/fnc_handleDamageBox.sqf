#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, johnb43
 * Handles all incoming damage for boxes.
 *
 * Arguments:
 * HandleDamage EH <ARRAY>
 *
 * Return Value:
 * Damage to be inflicted (can be nil) <NUMBER or NIL>
 *
 * Example:
 * _this call ace_cookoff_fnc_handleDamageBox
 *
 * Public: No
 */

// If cookoff for boxes is disabled, exit
if (!GVAR(enableAmmobox) || {GVAR(ammoCookoffDuration) == 0}) exitWith {};

params ["_box", "_selection", "_damage", "_source", "_ammo", "_hitIndex", "_instigator", "_hitPoint", "", "_context"];

if (!local _box) exitWith {};

// If it's already dead, ignore
if (!alive _box) exitWith {};

private _currentDamage = if (_selection != "") then {
    _box getHitIndex _hitIndex
} else {
    damage _box
};

// Killing units via End key is an edge case (#10375)
// This didn't matter pre-Arma 3 2.18 but now this goes through the event handler
// TODO: Structural fire damage >= 1 in a single damage event could still be caught here and we don't want that, but we haven't found a better way to catch this, fire damage should be small most of the time anyway
if (_context == 0 && {(abs (_damage - _currentDamage - 1)) < 0.001 && _ammo == "" && isNull _source && isNull _instigator}) exitWith {_damage};

if !(_box getVariable [QGVAR(enableAmmoCookoff), true]) exitWith {};

if !(_hitPoint == "" && {_damage > 0.5}) exitWith {}; // "" means structural damage

private _ammoConfig = _ammo call CBA_fnc_getObjectConfig;

// Catch fire when hit by an explosive or incendiary round
if ((getNumber (_ammoConfig >> "explosive") >= 0.5) || {getNumber (_ammoConfig >> QEGVAR(vehicle_damage,incendiary)) > random 1}) then {
    [QGVAR(cookOffBoxServer), [_box, _source, _instigator]] call CBA_fnc_serverEvent;
} else {
    // There is a small chance of cooking a box off if it's shot by tracer ammo
    if (random 1 >= _damage * 0.05) exitWith {};

    // Need magazine to check for tracers
    private _magazine = if (_source == _instigator) then {
        currentMagazine _source
    } else {
        _source currentMagazineTurret (_source unitTurret _instigator)
    };

    private _configMagazine = configFile >> "CfgMagazines" >> _magazine;

    // Magazine could have changed during flight time (just ignore if so)
    if (getText (_configMagazine >> "ammo") == _ammo) then {
        // If magazine's tracer density is high enough then low chance for cook off
        private _tracers = getNumber (_configMagazine >> "tracersEvery");

        if (_tracers >= 1 && {_tracers <= 4}) then {
            [QGVAR(cookOffBoxServer), [_box, _source, _instigator]] call CBA_fnc_serverEvent;
        };
    };
};

// Prevent destruction, let cook-off handle it if necessary
_damage min 0.89
