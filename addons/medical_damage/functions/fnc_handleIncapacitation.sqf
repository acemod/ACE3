/*
 * Author: Ruthberg
 * Handle incapacitation due to damage and pain
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * nothing
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _painLevel = GET_PAIN_PERCEIVED(_unit);
private _bodyPartDamage = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];

_bodyPartDamage params ["_headDamage", "_bodyDamage", "_leftArmDamage", "_rightArmDamage", "_leftLegDamage", "_rightLegDamage"];

// Exclude non penetrating body damage
{
    _x params ["", "", "_bodyPartN", "_amountOf", "", "_damage"];
    if (_bodyPartN == 1 && {_damage < PENETRATION_THRESHOLD}) then {
        _bodyDamage = _bodyDamage - (_amountOf * _damage);
    };
} forEach (_unit getVariable [QEGVAR(medical,openWounds), []]);

private _damageThreshold = if (isPlayer _unit) then {
    EGVAR(medical,playerDamageThreshold)
} else {
    EGVAR(medical,AIDamageThreshold)
};

if ((_headDamage > _damageThreshold / 2) || {_bodyDamage > _damageThreshold} || {(_painLevel >= PAIN_UNCONSCIOUS) && {random 1 < 0.1}}) then {
    [QEGVAR(medical,CriticalInjury), _unit] call CBA_fnc_localEvent;
};
