/*
 * Author: commy2
 * Damages a body part of a local unit. Does not kill the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Selection, can be "Head", "Body", "Arms" or "Legs" <STRING>
 * 2: Damage (optional, default: true) <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "HEAD"] call ace_medical_engine_fnc_damageBodyPart
 *
 * Notes:
 * Head: Blood visuals @ 0.45
 * Body: Blood visuals @ 0.45
 * Arms: Blood visuals @ 0.35, increases weapon sway linerarly
 * Legs: Blood visuals @ 0.35, limping @ 0.5
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_selection", "", [""]], ["_damage", true, [false]]];

if (!local _unit) exitWith {
    ERROR("Unit not local or null");
};

_damage = [0, 0.495] select _damage;

switch (toLower _selection) do {
    case ("head"): {
        _unit setHitPointDamage ["HitHead", _damage];
    };
    case ("body"): {
        _unit setHitPointDamage ["HitBody", _damage];
    };
    case ("arms"): {
        _unit setHitPointDamage ["HitHands", _damage + ([0, PAIN_MAX_DAMAGE] select (_unit getVariable [QGVAR(isInPain), false]))];
    };
    case ("legs"): {
        _unit setHitPointDamage ["HitLegs", _damage + ([0, LIMPING_MIN_DAMAGE] select (_unit getVariable [QGVAR(isLimping), false]))];
    };
};
