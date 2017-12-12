/*
 * Author: Commy2 and esteldunedain
 * Handle weapon fire, heat up the weapon
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 3: Muzzle <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "weapon", "muzzle", "ammo", "magazine", bullet] call ace_overheating_fnc_overheat
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_weapon", "", "", "_ammo", "", "_projectile"];
TRACE_4("params",_unit,_weapon,_ammo,_projectile);

BEGIN_COUNTER(overheat);

// Get bullet parameters
private _energyIncrement = GVAR(cacheAmmoData) getVariable _ammo;
if (isNil "_energyIncrement") then {
    _bulletMass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_BulletMass");
    if (_bulletMass == 0) then {
        // If the bullet mass is not configured, estimate it
        _bulletMass = 3.4334 + 0.5171 * (getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit") + getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber"));
    };
    
    // Projectile motion is roughly equal to Barrel heat
    // Ref: https://en.wikipedia.org/wiki/Physics_of_firearms
    // Muzzle Engergy = 1/2 * m * v^2 = (1/2 * 0.001 g/kg * bulletMass (grams) * v^2)
    // Multiple by 3 becase we only calc every 3rd bullet: (3 * 1/2 * 0.001) = 0.0015
    private _energyIncrement = 0.0015 * _bulletMass * (vectorMagnitudeSqr velocity _projectile);

    GVAR(cacheAmmoData) setVariable [_ammo, _energyIncrement];
};

// Increase overheating depending on how obstrusive is the current supressor,
// if any. Typical arma supressors have visibleFire=0.5 and audibleFire=0.3,
// so they produce x2.1 overheating
private _silencer = switch (_weapon) do {
    case (primaryWeapon _unit) : {(primaryWeaponItems _unit) select 0};
    case (handgunWeapon _unit) : {(handgunItems _unit) select 0};
    default {""};
};
if (_silencer != "") then {
    private _silencerCoef = GVAR(cacheSilencerData) getVariable _silencer;
    if (isNil "_silencerCoef") then {
        _silencerCoef = 1 +
                        (1 - getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "audibleFire")) +
                        (1 - getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "visibleFire"));
        GVAR(cacheSilencerData) setVariable [_silencer, _silencerCoef];
    };
    _energyIncrement = _energyIncrement * _silencerCoef;
};

TRACE_1("heat",_energyIncrement);

[_unit, _weapon, _energyIncrement] call FUNC(updateTemperature);

END_COUNTER(overheat);
