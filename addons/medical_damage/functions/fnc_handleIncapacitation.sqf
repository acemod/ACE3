#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Handle incapacitation due to damage and pain
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * None
 *
 * Example:
 * [player] call ace_medical_damage_fnc_handleIncapacitation
 *
 * Public: No
 */

params ["_unit"];

private _painLevel = GET_PAIN_PERCEIVED(_unit);
private _bodyPartDamage = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];

_bodyPartDamage params ["_headDamage", "_bodyDamage", "_leftArmDamage", "_rightArmDamage", "_leftLegDamage", "_rightLegDamage"];

// Exclude non penetrating body damage
{
    _x params ["", "_amountOf", "", "_damage"];
    if (_damage < PENETRATION_THRESHOLD) then {
        _bodyDamage = _bodyDamage - (_amountOf * _damage);
    };
} forEach (GET_OPEN_WOUNDS(_unit) getOrDefault ["body", []]);

private _damageThreshold = GET_DAMAGE_THRESHOLD(_unit);

if ((_headDamage > _damageThreshold / 2) || {_bodyDamage > _damageThreshold} || {(_painLevel >= PAIN_UNCONSCIOUS) && {random 1 < EGVAR(medical,painUnconsciousChance)}}) then {
    [QEGVAR(medical,CriticalInjury), _unit] call CBA_fnc_localEvent;
};
