/*
 * Author: commy2
 * Forces a unit to limp or not.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Limping (optional, default: true) <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_medical_engine_fnc_setLimping
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_isLimping", true, [false]]];

if (!local _unit) exitWith {
    ERROR("Unit not local or null");
};

_unit setVariable [QGVAR(isLimping), _isLimping, true];

if (_isLimping) then {
    if (_unit getHitPointDamage "HitLegs" >= DAMAGED_MIN_THRESHOLD && {_unit getHitPointDamage "HitLegs" != LIMPING_MIN_DAMAGE}) then {
        [_unit, "Legs", true] call FUNC(damageBodyPart);
    } else {
        [_unit, "Legs", false] call FUNC(damageBodyPart);
    };
} else {
    if (_unit getHitPointDamage "HitLegs" >= DAMAGED_MIN_THRESHOLD && {_unit getHitPointDamage "HitLegs" != LIMPING_MIN_DAMAGE}) then {
        [_unit, "Legs", true] call FUNC(damageBodyPart);
    } else {
        [_unit, "Legs", false] call FUNC(damageBodyPart);
    };
};
