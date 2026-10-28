#include "..\script_component.hpp"
/*
 * Author: commy2
 * Damages a body part of a local unit. Does not kill the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Selection, can be "Head", "Body", "Arms" or "Legs" <STRING>
 * 2: Damaged <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "HEAD", true] call ace_medical_engine_fnc_damageBodyPart
 *
 * Notes:
 * Head: Blood visuals @ 0.45
 * Body: Blood visuals @ 0.45
 * Arms: Blood visuals @ 0.35, increases weapon sway linerarly
 * Legs: Blood visuals @ 0.35, limping @ 0.5
 *
 * Public: No
 */

params ["_unit", "_selection", "_damage"];
TRACE_3("damageBodyPart",_unit,_selection,_damage);

_damage = [0, DAMAGED_MIN_THRESHOLD] select _damage;

private _hitPoint = switch (toLowerANSI _selection) do {
    case ("head"): {"HitHead"};
    case ("body"): {"HitBody"};
    case ("arms"): {"HitHands"};
    case ("legs"): {
        _damage = _damage + ([0, LIMPING_MIN_DAMAGE] select (_unit getVariable [QEGVAR(medical,isLimping), false]));
        "HitLegs"
    };
    default {""};
};

// Every wound refreshes these, but they rarely change (e.g. bodies hit again and again)
// Skip setting (and broadcasting) the same value again
if (_hitPoint != "" && {_unit getHitPointDamage _hitPoint != _damage}) then {
    _unit setHitPointDamage [_hitPoint, _damage];
};
