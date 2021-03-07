#include "script_component.hpp"
/*
 * Author: PabstMirror, Glowbal
 * Determines if damage is fatal
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Part No <NUMBER>
 * 2: Damage Array - QGVAR(medical,bodyPartDamage) <ARRAY>
 * 3: New Damage <NUMBER>
 *
 * ReturnValue:
 * Was Fatal <BOOL>
 *
 * Example:
 * [player, 0, 1.4, 0.7] call ace_medical_damage_fnc_determineIfFatal
 *
 * Public: No
 */

params ["_unit", "_part", "_bodyPartDamage", "_woundDamage"];

if (_part > 1) exitWith { false };

scopeName "main";

if (EGVAR(medical,fatalDamageSource) in [0, 2]) then {
    // Emulate damage to vital organs - Original rewrite logic, only powerfull headshots or random torso shots
    if (_part == 0 && {_woundDamage >= HEAD_DAMAGE_THRESHOLD}) exitWith {
        // Fatal damage to the head is guaranteed death
        TRACE_1("determineIfFatal: lethal headshot",_woundDamage);
        true breakOut "main";
    };
    if (_part == 1 && {_woundDamage >= ORGAN_DAMAGE_THRESHOLD} && {random 1 < HEART_HIT_CHANCE}) exitWith {
        // Fatal damage to torso has various results based on organ hit - Heart shot is lethal
        TRACE_1("determineIfFatal: lethal heartshot",_woundDamage);
        true breakOut "main";
    };
};
if (EGVAR(medical,fatalDamageSource) in [1, 2]) then {
    // Sum of trauma to critical areas can be fatal (e.g. many small hits)
    private _damageThreshold = GET_DAMAGE_THRESHOLD(_unit);
    private _headThreshhold = 1.25 * _damageThreshold;
    private _bodyThreshhold = 1.5 * _damageThreshold;

    _bodyPartDamage params ["_headDamage", "_bodyDamage"];

    private _vitalDamage = ((_headDamage - _headThreshhold) max 0) + ((_bodyDamage - _bodyThreshhold) max 0);
    private _chanceFatal = 1 - exp -((_vitalDamage/FATAL_SUM_DAMAGE_WEIBULL_L)^FATAL_SUM_DAMAGE_WEIBULL_K);
    TRACE_3("",_bodyPartDamage,_vitalDamage,_chanceFatal);

    if (_chanceFatal > random 1) exitWith {
        TRACE_1("determineIfFatal: lethal trauma",_woundDamage);
        true breakOut "main";
    };
};

false

