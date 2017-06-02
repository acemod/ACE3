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

#define INCREASE_CHANCE_HEAD 0.05
#define INCREASE_CHANCE_TORSO 0.03
#define INCREASE_CHANGE_LIMB 0.01

#define CHANGE_FATAL_HEAD 0.7
#define CHANGE_FATAL_TORSO 0.6
#define CHANGE_FATAL_LIMB 0.1

params ["_unit", "_part", ["_withDamage", 0]];

if (!alive _unit) exitWith {true};
if ((vehicle _unit != _unit) && {!alive (vehicle _unit)}) exitWith { true };
if (_part < 0 || _part > 5) exitWith {false};

// Find the correct Damage threshold for unit.
private _damageThreshold = [1,1,1];
if ([_unit, GVAR(remoteControlledAI)] call EFUNC(common,isPlayer)) then {
    _damageThreshold =_unit getVariable[QGVAR(unitDamageThreshold), [GVAR(playerDamageThreshold), GVAR(playerDamageThreshold), GVAR(playerDamageThreshold) * 1.7]];
} else {
    _damageThreshold =_unit getVariable[QGVAR(unitDamageThreshold), [GVAR(AIDamageThreshold), GVAR(AIDamageThreshold), GVAR(AIDamageThreshold) * 1.7]];
};
_damageThreshold params ["_thresholdHead", "_thresholdTorso",  "_thresholdLimbs"];

private _damageBodyPart = ((_unit getVariable [QGVAR(bodyPartStatus),[0, 0, 0, 0, 0, 0]]) select _part) + _withDamage;

// Check if damage to body part is higher as damage head
if (_part == 0) exitWith {
    private _chanceFatal = CHANGE_FATAL_HEAD + ((INCREASE_CHANCE_HEAD * (_damageBodyPart - _thresholdHead)) * 10);
    (_damageBodyPart >= _thresholdHead && {(_chanceFatal >= random(1))});
};

// Check if damage to body part is higher as damage torso
if (_part == 1) exitWith {
    private _chanceFatal = CHANGE_FATAL_TORSO + ((INCREASE_CHANCE_TORSO * (_damageBodyPart - _thresholdTorso)) * 10);
    (_damageBodyPart >= _thresholdTorso && {(_chanceFatal >= random(1))});
};
// Check if damage to body part is higher as damage limbs
// We use a slightly lower decrease for limbs, as we want any injuries done to those to be less likely to be fatal compared to head shots or torso.
private _chanceFatal = CHANGE_FATAL_LIMB + ((INCREASE_CHANGE_LIMB * (_damageBodyPart - _thresholdLimbs)) * 10);
(_damageBodyPart >= _thresholdLimbs && {(_chanceFatal >= random(1))});
