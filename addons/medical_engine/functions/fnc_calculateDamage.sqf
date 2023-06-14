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

// B_556x45_Ball
#define BASE_SCALING_DAMAGE 9
#define BASE_SCALING_CALIBER 0.869565
// Magic numbers, tweak until expected results
#define DAMAGE_SCALING_FACTOR 1.4
#define ARMOR_NEGATION_FACTOR 9
// Extra damage from overpenetration
#define OVERKILL_FACTOR 2


params ["_damage", "_ammo", "_armor"];

// Skip environmental damage
if (_ammo isEqualTo "") exitWith {
    _damage // return
};

// Get ammo data to calculate penetration
([_ammo] call FUNC(getAmmoData)) params ["", "_caliber"];

private _penFactor = (_caliber / BASE_SCALING_CALIBER);

// Penetration factor negates armor, we use the vanilla V_PlateCarrier1_blk and B_556x45_Ball as a scaling reference, with increase in ammo "caliber" being exponential for armor negation
// This is gameified and balanced around vanilla armor behavior, since we can't get fireGeometry data for models and their materials can't be relied upon
// A more elegant solution would be using the "HitPart" eventhandler for damage instead, but we'd have issues with reliability due to locality and performance
// Ideally, we want B_556x45_Ball hitting V_PlateCarrier1_blk at point blank to deal ~0.35 damage and scale up to B_127x108 dealing ~2.5 damage on overpenetration
// This should be compatible with weapon and armor mods balanced around vanilla or Spartan0536's values (https://forums.bohemia.net/forums/topic/163694-arma-iii-ballistics-overhaul/)

private _armorNegated = ARMOR_NEGATION_FACTOR * _penFactor;
_damage = (sqrt ((_damage / BASE_SCALING_DAMAGE) / (1 max (_armor - _armorNegated)))) * DAMAGE_SCALING_FACTOR;
if ( _armorNegated > (_armor * 2)) then {
    _damage = _damage * OVERKILL_FACTOR;
};
TRACE_5("finalDamage", _damage,_ammo,_penFactor,_armor,_armorNegated);
_damage // return
