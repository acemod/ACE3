#include "script_component.hpp"
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

params [["_unit", objNull, [objNull]], ["_isLimping", true, [false]]];

if (!local _unit) exitWith {
    ERROR("Unit not local or null");
};

_unit setVariable [QEGVAR(medical,isLimping), _isLimping, true];

// refresh
private _isDamaged = _unit getHitPointDamage "HitLegs" >= DAMAGED_MIN_THRESHOLD && {_unit getHitPointDamage "HitLegs" != LIMPING_MIN_DAMAGE};

[_unit, "Legs", _isDamaged] call FUNC(damageBodyPart);
