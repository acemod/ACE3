#include "script_component.hpp"
/*
 * Author: Commy2 and esteldunedain
 * Handle weapon fire. Called from the unified fired EH 1- always for the local player 2- and for non local players if dispersion is simulated.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_overheating_fnc_firedEH
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

BEGIN_COUNTER(firedEH);

if ((_unit distance ACE_player) > GVAR(particleEffectsAndDispersionDistance)
    || {(_muzzle != (primaryWeapon _unit)) && {_muzzle != (handgunWeapon _unit)}}) exitWith { // Only rifle or pistol muzzles (ignore grenades / GLs)
    END_COUNTER(firedEH);
};

// Get current temperature from the unit variable
private _temperature = _unit getVariable [format [QGVAR(%1_temp), _weapon], 0];
private _scaledTemperature = linearConversion [0, 1000, _temperature, 0, 1, true];

TRACE_2("Unit fired with temp:",_unit,_temperature);

// Get weapon data from cache:
([_weapon] call FUNC(getWeaponData)) params ["_dispersion", "_slowdownFactor", "_jamChance"];
TRACE_4("weapon data from cache",_weapon,_dispersion,_slowdownFactor,_jamChance);

if (_scaledTemperature > 0.1) then {
    // Dispersion and bullet slow down
    if (GVAR(overheatingDispersion)) then {
        if (isNil QGVAR(pseudoRandomList)) exitWith {ERROR("No pseudoRandomList sync");};

        //Dispersion: 0 mils @ 0°C, 0.5 mils @ 333°C, 2.2 mils @ 666°C, 5 mils at 1000°C
        _dispersion = _dispersion * 0.28125 * (_scaledTemperature^2);

        _slowdownFactor = _slowdownFactor * linearConversion [0.666, 1, _scaledTemperature, 0, -0.1, true];

        // Get the pseudo random values for dispersion from the remaining ammo count
        (GVAR(pseudoRandomList) select ((_unit ammo _weapon) mod (count GVAR(pseudoRandomList)))) params ["_dispersionX", "_dispersionY"];

        TRACE_4("change",_dispersion,_slowdownFactor,_dispersionX,_dispersionY);

        TRACE_PROJECTILE_INFO(_projectile);
        [_projectile, _dispersionX * _dispersion, _dispersionY * _dispersion, _slowdownFactor * vectorMagnitude (velocity _projectile)] call EFUNC(common,changeProjectileDirection);
        TRACE_PROJECTILE_INFO(_projectile);
    };

    // Particle Effects
    if (GVAR(showParticleEffects)
        && {GVAR(showParticleEffectsForEveryone) || {_unit == ACE_player} || {_unit distance ACE_player <= 20}}
        && {CBA_missionTime > (_unit getVariable [QGVAR(lastDrop), -1000]) + 0.40}) then {

        _unit setVariable [QGVAR(lastDrop), CBA_missionTime];

        private _direction = (_unit weaponDirection _weapon) vectorMultiply 0.25;
        private _position = (position _projectile) vectorAdd (_direction vectorMultiply (4*(random 0.30)));

        // Refract SFX, beginning at temp 100°C and maxs out at 500°C
        private _intensity = linearConversion [0.1, 0.5, _scaledTemperature, 0, 1, true];
        TRACE_3("refract",_direction,_position,_intensity);
        if (_intensity > 0) then {
            drop [
            "\A3\data_f\ParticleEffects\Universal\Refract", "", "Billboard", 10, 2, _position, _direction, 0, 1.2, 1.0,
            0.1, [0.10,0.25], [[0.6,0.6,0.6,0.3 * _intensity],[0.2,0.2,0.2,0.05 * _intensity]], [0,1], 0.1, 0.05, "", "", ""];
        };
        // Smoke SFX, beginning at temp 150°C
        private _intensity = linearConversion [0.15, 1, _scaledTemperature, 0, 1, true];
        TRACE_3("smoke",_direction,_position,_intensity);
        if (_intensity > 0) then {
            drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 1, 16], "", "Billboard", 10, 1.2, _position,
            [0,0,0.15], 100 + random 80, 1.275, 1, 0.025, [0.15,0.43], [[0.6,0.6,0.6,0.5 * _intensity],[0.2,0.2,0.2,0.15 * _intensity]],
            [0,1], 1, 0.04, "", "", ""];
        };
    };
};

// ------  LOCAL PLAYER ONLY ------------
// Only compute jamming for the local player
if (_unit != ACE_player) exitWith {END_COUNTER(firedEH);};

// Compute new temperature once every 3 bullets
if ((_unit ammo _weapon) % 3 == 0) then {
    _this call FUNC(overheat);
};

// reset cookoff heat
if (GVAR(cookoffCoef) > 0) then {
    _unit setVariable [format [QGVAR(%1_ammoTemp), _weapon], 0];
    [_unit, _weapon, _temperature] call FUNC(updateAmmoTemperature);
};

// decrease time to next shot as heat increases, value is a coef where 1 is unchanged and 0 is instant, 0.8 is a 25% faster ROF.
// this could be filtered by weapon type, but I think the heat gain and rate of fire on non-automatic weapons is low enough not to bother
if (GVAR(overheatingRateOfFire)) then {
    _unit setWeaponReloadingTime [_unit, _muzzle, linearConversion [0, 0.5, _scaledTemperature, 1, 0.909, true]];
};

// Don't bother with jamming if coef makes the chance 0.
if (GVAR(jamChanceCoef) == 0) exitWith {END_COUNTER(firedEH);};

private _value = 5 * _scaledTemperature;
private _array = [0.5, 1, 2, 8, 20, 150];
_jamChance = _jamChance * GVAR(jamChanceCoef) * linearConversion [0, 1, _value % 1, _array select floor _value, _array select ceil _value];

TRACE_3("check for random jam",_unit,_weapon,_jamChance);

private _randomNumber = random 1;

// Fail early if we know that we won't have a malfunction regardless of the ground type.
if (_randomNumber < _jamChance * 2) then {
    if (_randomNumber > _jamChance) then {
        // Increase jam chance on dusty grounds if prone (and at ground level)
        if ((stance _unit == "PRONE") && {((getPosATL _unit) select 2) < 1}) then {
            private _surface = configFile >> "CfgSurfaces" >> ((surfaceType getPosASL _unit) select [1]);
            if (isClass _surface) then {
                TRACE_1("dust",getNumber (_surface >> "dust"));
                _jamChance = _jamChance + (getNumber (_surface >> "dust")) * _jamChance;
            };
        };
    };
    if (_randomNumber < _jamChance) then {
        [_unit, _weapon] call FUNC(jamWeapon);
    };
};

END_COUNTER(firedEH);
