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
// _penFactor is ammo "caliber" * penetrability, for simplification we consider an armor value of 1 to be equivalent to 1mm of RHA (penetrability 0.015)
// While composite armor is actually harder to penetrate than RHA, this also includes the unit's body, soft armor inserts, uniform, and other factors, so it's a good enough approximation
// See (https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber),
([_ammo] call FUNC(getAmmoData)) params ["_hit", "_crossSection", "_penFactor", "_typicalSpeed"];

private _impactSpeed = (_damage/_hit) * _typicalSpeed; // _damage is _hit at _typicalSpeed, see https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#typicalSpeed
if (_impactSpeed < MINIMUM_VELOCITY) exitWith {
    TRACE_2("projectile under minimum damage velocity",_ammo,_impactSpeed);
    0 // return
};

// We'll use this value as baseline for unprotected body parts, this allows pistols to remain relevant
// There's no need to calculate penetration if there is no armor to begin with
private _penDepth = SCALED_UNPROTECTED_VALUE;
if (_armor >= SCALED_UNPROTECTED_VALUE) then {
    _penDepth = (_penFactor * _impactSpeed) * random [0.75, 1, 1.25]; // penetration can vary a bit for more damage variety
};
TRACE_3("impact",_impactSpeed,_penDepth,_armor);

// We want to base damage on the round's weight, cross-section, velocity, and energy spent penetrating armor, so we'll use the config value to get damage
// Because impactSpeed comes from the engine impact damage, this already handles damage loss from hits at oblique angles
// There's only so much damage a round can do, limited by the base resistance of an unprotected limb and its energy/cross-section
_damage = ((_hit * _crossSection) * ((_penDepth/_armor) min 1)^2) / SCALED_UNPROTECTED_VALUE;

#ifdef DEBUG_MODE_FULL
systemChat format ["dam: %1, armor: %2, penDepth: %3, hit: %4, crossSection: %5", _damage, _armor, _penDepth, _hit, _crossSection];
#endif
TRACE_4("finalDamage",_damage,_ammo,_armor,_penDepth);
_damage // return
