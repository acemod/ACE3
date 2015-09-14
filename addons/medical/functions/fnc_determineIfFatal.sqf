/*
 * Author: Glowbal
 * Determine If Fatal
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Part <NUMBER>
 * 2: with Damage <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_damageThreshold", "_damageBodyPart"];
params ["_unit", "_part", ["_withDamage", 0]];

if (!alive _unit) exitwith {true};
if (_part < 0 || _part > 5) exitwith {false};
if ((vehicle _unit != _unit) && {!alive (vehicle _unit)}) exitwith { true };

// Find the correct Damage threshold for unit.
_damageThreshold = [1,1,1];
if ([_unit] call EFUNC(common,IsPlayer)) then {
    _damageThreshold =_unit getvariable[QGVAR(unitDamageThreshold), [GVAR(playerDamageThreshold), GVAR(playerDamageThreshold), GVAR(playerDamageThreshold) * 1.7]];
} else {
    _damageThreshold =_unit getvariable[QGVAR(unitDamageThreshold), [GVAR(AIDamageThreshold), GVAR(AIDamageThreshold), GVAR(AIDamageThreshold) * 1.7]];
};

_damageBodyPart = ((_unit getvariable [QGVAR(bodyPartStatus),[0, 0, 0, 0, 0, 0]]) select _part) + _withDamage;

// Check if damage to body part is higher as damage head
if (_part == 0) exitwith {
    (_damageBodyPart >= (_damageThreshold select 0) && {(random(1) > 0.2)});
};

// Check if damage to body part is higher as damage torso
if (_part == 1) exitwith {
    (_damageBodyPart >= (_damageThreshold select 1) && {(random(1) > 0.35)});
};
// Check if damage to body part is higher as damage limbs
(_damageBodyPart >= (_damageThreshold select 2) && {(random(1) > 0.95)});
