/*
 * Author: commy2
 * Updates weapon sway caused by pain.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_medical_engine_fnc_updatePainSway
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (!local _unit) exitWith {
    ACE_LOGERROR("Unit not local or null");
};

private _damage = PAIN_MAX_DAMAGE * ((_unit getVariable [QEGVAR(medical,pain), 0]) min 1);

_unit setVariable [QGVAR(painSway), _damage];

if (_unit getHitPointDamage "HitHands" > DAMAGED_MIN_THRESHOLD) then {
    _damage = _damage + DAMAGED_MIN_THRESHOLD;
};

_unit setHitPointDamage ["HitHands", _damage];
