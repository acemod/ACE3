#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2
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

params ["_box", "", "_damage", "_source", "_ammo", "_hitIndex", "_instigator"];

if (!local _box) exitWith {};

// If it's already dead, ignore
if (damage _box >= 1) exitWith {};

// If cookoff for boxes is disabled, exit
if (!GVAR(enableAmmobox) || {GVAR(ammoCookoffDuration) == 0}) exitWith {};

if !(_box getVariable [QGVAR(enableAmmoCookoff), true]) exitWith {};

// Get hitpoint name
private _hitpoint = "#structural";

if (_hitIndex != -1) then {
    _hitpoint = ((getAllHitPointsDamage _box) param [0, []]) select _hitIndex;
};

if !(_hitpoint == "#structural" && {_damage > 0.5}) exitWith {};

// Catch fire when hit by an explosive round
if (IS_EXPLOSIVE_AMMO(_ammo)) then {
    [QGVAR(cookOffBox), [_box, _source, _instigator]] call CBA_fnc_serverEvent;
} else {
    // Get change in damage
    private _oldDamage = if (_hitpoint == "#structural") then {
        damage _box
    } else {
        _box getHitIndex _hitIndex
    };

    // There is a small chance of cooking a box off if it's shot by tracer ammo
    if !(random 1 < _oldDamage * 0.05) exitWith {};

    // Need magazine to check for tracers
    private _magazine = if (_source == _instigator) then {
        currentMagazine _source
    } else {
        _source currentMagazineTurret (_box unitTurret _instigator)
    };

    private _configMagazine = configFile >> "CfgMagazines" >> _magazine;

    // Magazine could have changed during flight time (just ignore if so)
    if (getText (_configMagazine >> "ammo") == _ammo) then {
        // If magazine's tracer density is high enough then low chance for cook off
        private _tracers = getNumber (_configMagazine >> "tracersEvery");

        if (_tracers >= 1 && {_tracers <= 4}) then {
            [QGVAR(cookOffBox), [_box, _source, _instigator]] call CBA_fnc_serverEvent;
        };
    };
};

// Prevent destruction, let cook-off handle it if necessary
_damage min 0.89
