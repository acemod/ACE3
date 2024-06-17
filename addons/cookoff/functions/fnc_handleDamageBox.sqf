#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, johnb43
 * Handles all incoming damage for boxes.
 *
 * Arguments:
 * HandleDamage EH <ARRAY>
 *
 * Return Value:
 * Damage to be inflicted (can be nil) <NUMBER>
 *
 * Example:
 * _this call ace_cookoff_fnc_handleDamageBox
 *
 * Public: No
 */

// If cookoff for boxes is disabled, exit
if (!GVAR(enableAmmobox) || {GVAR(ammoCookoffDuration) == 0}) exitWith {};

params ["_box", "", "_damage", "_source", "_ammo", "", "_instigator", "_hitPoint"];

if (!local _box) exitWith {};

// If it's already dead, ignore
if (!alive _box) exitWith {};

if !(_box getVariable [QGVAR(enableAmmoCookoff), true]) exitWith {};

if !(_hitPoint == "" && {_damage > 0.5}) exitWith {}; // "" means structural damage

private _ammoConfig = _ammo call CBA_fnc_getObjectConfig;

// Catch fire when hit by an explosive or incendiary round
if (
    (getNumber (_ammoConfig >> "explosive") >= 0.5) ||
    {getNumber (_ammoConfig >> QEGVAR(vehicle_damage,incendiary)) > random 1} ||
    {_damage * 0.05 > random 1 && {_ammo getShotInfo 4}} // there is a small chance of cooking a box off if it's shot by tracer ammo
) then {
    [QGVAR(cookOffBoxServer), [_box, _source, _instigator]] call CBA_fnc_serverEvent;
};

// Prevent destruction, let cook-off handle it if necessary
_damage min 0.89
