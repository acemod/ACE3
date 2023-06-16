#include "script_component.hpp"
/*
 * Author: Salluci
 * Calculates final damage inflicted by a round using scaled hitpoint armor and real damage, taking penetration into account
 *
 * Arguments:
 * 0: Real damage <NUMBER>
 * 1: Impact ammo <STRING>
 * 2: Scaled hitpoint armor <NUMBER>
 *
 * Return Value:
 * Final damage for the given hitpoint <NUMBER>
 *
 * Example:
 * [9, "B_556x45_Ball", 32] call ace_medical_engine_fnc_calculateDamage
 *
 * Public: No
 */

// Average of values in https://pubmed.ncbi.nlm.nih.gov/7304523/
#define MINIMUM_VELOCITY 50
// armor 12 with passthrough 0.5 + a standard uniform, armor 2 with passthrough 0.8
#define SCALED_SOFT_ARMOR_MAX_VALUE 18
// armor 2 with passthrough 0.8
#define SCALED_UNPROTECTED_VALUE 4
params ["_damage", "_ammo", "_armor"];

// Skip environmental damage, everything that isn't a bullet, and shrapnel
if !(_ammo isNotEqualTo "" && {_ammo isKindOf "BulletBase"} && {!(_ammo isKindOf "ace_frag_base")} && {_ammo isNotEqualTo "rhs_he_fragments"}) exitWith {
    TRACE_1("skipping non-bullet damage",_ammo);
    _damage // return
};

// Get ammo data to calculate penetration
// _penFactor is ammo "caliber" * penetrability, for simplification we consider an armor value of 1 to be equivalent to 0.667mm of RHA (penetrability 0.015)
// While composite armor is actually harder to penetrate than RHA, this also includes the unit's body, soft armor inserts, uniform, and other factors, so it's a good enough approximation
// See (https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber),
([_ammo] call FUNC(getAmmoData)) params ["_hit", "_penFactor", "_typicalSpeed"];

private _impactSpeed = (_damage/_hit) * _typicalSpeed; // _damage is _hit at _typicalSpeed, see https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#typicalSpeed
if (_impactSpeed < MINIMUM_VELOCITY) exitWith {
    TRACE_2("projectile under minimum damage velocity",_ammo,_impactSpeed);
    0 // return
};

// Between 5 and 35% of the projectile's energy is always transferred to the unit
// This adds some variety to damage and allows for both lucky hits and survival, rewarding concentrated automatic fire
private _energyTransferred = random [0.05, 0.2, 0.35];

// We'll use this value as baseline for unprotected body parts, this allows pistols to remain relevant
// There's no need to calculate penetration if there is no armor to begin with
private _penDepth = 2;
if (_armor >= SCALED_UNPROTECTED_VALUE) then {
    _penDepth = _penFactor * _impactSpeed * (1 - _energyTransferred);

    // We also want pistols to be relevant against soft armor (armor levels 8-12) but fall off beyond that
    // Increasing penetration directly is fine in this case with a compensation for what should be hollow points
    // The idea is soft armor should catch most pistol rounds, but not all
    if (_armor <= SCALED_SOFT_ARMOR_MAX_VALUE) then {
        _penDepth = _penDepth + (1/(_penFactor * _armor)) + random [0, 0.2, 1];
        TRACE_2("hit soft armor",_penDepth,_penFactor);
    };
};
TRACE_4("impact",_impactSpeed,_penDepth,_energyTransferred,_armor);

// We want to base damage on the weight of the round, its velocity, and how much energy was spent penetrating armor, so we'll use the config value to get damage
// Because impactSpeed comes from the engine impact damage, this already handles damage loss from hits at oblique angles
_damage = _hit * sqrt((_impactSpeed * _energyTransferred) / _typicalSpeed);

// Now we reduce the armor, capping at 2 because there's only so much damage a single projectile can do
_damage = _damage / (2 max (_armor - _penDepth));

TRACE_4("finalDamage",_damage,_ammo,_armor,_penDepth);
_damage // return
