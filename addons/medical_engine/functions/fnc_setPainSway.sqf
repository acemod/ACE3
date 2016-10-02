/*
 * Author: commy2
 * Updates weapon sway caused by pain.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: In pain (optional, default: true) <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_medical_engine_fnc_setPainSway
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_isInPain", true, [false]]];

if (!local _unit) exitWith {
    ERROR("Unit not local or null");
};

_unit setVariable [GVAR(isInPain), _isInPain, true];

[_unit, "Arms", _unit getHitPointDamage "HitHands" >= DAMAGED_MIN_THRESHOLD] call FUNC(damageBodyPart);
