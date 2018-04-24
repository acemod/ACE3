/*
 * Author: KoffeinFlummi, commy2
 * Handles all incoming damage for tanks (including wheeled APCs).
 *
 * Arguments:
 * HandleDamage EH <ARRAY>
 *
 * Return Value:
 * Damage to be inflicted. <NUMBER>
 *
 * Example:
 * _this call ace_cookoff_fnc_handleDamage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_simulationType", "_thisHandleDamage"];
_thisHandleDamage params ["_vehicle", "", "_damage", "_source", "_ammo", "_hitIndex", "_shooter"];

// it's already dead, who cares?
if (damage _vehicle >= 1) exitWith {};

// get hitpoint name
private _hitpoint = "#structural";

if (_hitIndex != -1) then {
    _hitpoint = toLower ((getAllHitPointsDamage _vehicle param [0, []]) select _hitIndex);
};

// get change in damage
private _oldDamage = 0;

if (_hitpoint isEqualTo "#structural") then {
    _oldDamage = damage _vehicle;
} else {
    _oldDamage = _vehicle getHitIndex _hitIndex;
};

private _newDamage = _damage - _oldDamage;

// handle different types of vehicles
// note: exitWith only works here, because this is not the main scope of handleDamage
// you cannot use the return value together with exitWith in the main scope, it's a bug
// also, we add this event handler with the addEventHandler SQF command,
// because the config version ignores the return value completely
if (_simulationType == "car") exitWith {
    // prevent destruction, let cook-off handle it if necessary
    if (_hitpoint in ["hithull", "hitfuel", "#structural"] && {!IS_EXPLOSIVE_AMMO(_ammo)}) then {
        _damage min 0.89
    } else {
        if (_hitpoint isEqualTo "hitengine" && {_damage > 0.9}) then {
            _vehicle call FUNC(engineFire);
        };
        _damage
    };
};

if (_simulationType == "tank") exitWith {
    // determine ammo storage location
    private _ammoLocationHitpoint = getText (_vehicle call CBA_fnc_getObjectConfig >> QGVAR(ammoLocation));

    if (_hitIndex in (GVAR(cacheTankDuplicates) getVariable (typeOf _vehicle))) then {
        _hitpoint = "#subturret";
    };

    // ammo was hit, high chance for cook-off
    if (_hitpoint == _ammoLocationHitpoint) then {
        if (_damage > 0.5) then {
            // get cookoff probability for vehicle
            private _probability = [_vehicle call CBA_fnc_getObjectConfig >> QGVAR(probability), "number", 0.7] call CBA_fnc_getConfigEntry;
            // probability multiplied by coef for global probability control (higher coef = more probable cookoff)
            if (GVAR(probabilityCoef) > 1) then {
                _probability = 1 - (1 - _probability) / GVAR(probabilityCoef);
            } else {
                _probability = _probability * GVAR(probabilityCoef);
            };
            if (random 1 < _probability) then {
                _vehicle call FUNC(cookOff);
            };
        };
    } else {
        if (_hitpoint in ["hithull", "hitturret", "#structural"] && {_newDamage > 0.8 + random 0.2}) then {
            if ((_hitpoint == "hitturret") && {(getNumber (_vehicle call CBA_fnc_getObjectConfig >> QGVAR(ignoreTurret))) == 1}) exitWith {}; // ignore turrets like RCWS
            _vehicle setDamage 1;
        };
    };

    // prevent destruction, let cook-off handle it if necessary
    if (_hitpoint in ["hithull", "hitfuel", "#structural"]) then {
        _damage min 0.89
    } else {
        _damage
    };
};

if (_simulationType == "box") exitWith {
    if (_hitpoint == "#structural" && _damage > 0.5) then {
        // Almost always catch fire when hit by an explosive
        if (IS_EXPLOSIVE_AMMO(_ammo)) then {
            _vehicle call FUNC(cookOffBox);
        } else {
            // Need magazine to check for tracers
            private _mag = "";
            if (_source == _shooter) then {
                _mag = currentMagazine _source;
            } else {
                _mag = _source currentMagazineTurret ([_shooter] call CBA_fnc_turretPath);
            };
            private _magCfg = configFile >> "CfgMagazines" >> _mag;

            // Magazine could have changed during flight time (just ignore if so)
            if (getText (_magCfg >> "ammo") == _ammo) then {
                // If magazine's tracer density is high enough then low chance for cook off
                private _tracers = getNumber (_magCfg >> "tracersEvery");
                if (_tracers >= 1 && {_tracers <= 4}) then {
                    if (random 1 < _oldDamage*0.05) then {
                        _vehicle call FUNC(cookOffBox);
                    };
                };
            };
        };

        // prevent destruction, let cook-off handle it if necessary
        _damage min 0.89
    } else {
        _damage
    };
};
