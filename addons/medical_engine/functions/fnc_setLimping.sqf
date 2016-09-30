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
    ACE_LOGERROR("Unit not local or null");
};

private _damage = [0, LIMPING_MIN_DAMAGE] select _isLimping;

_unit setHitPointDamage ["HitLegs", _damage];

_unit setVariable [QGVAR(isLimping), _isLimping, true];
