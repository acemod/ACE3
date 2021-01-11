#include "script_component.hpp"
/*
 * Author: PabstMirror, Glowbal
 * Determines if damage is fatal
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Was Fatal <BOOL>
 *
 * Example:
 * [player] call ace_medical_damage_fnc_determineIfFatal
 *
 * Public: No
 */

params ["_unit",  "_bodyPartDamage", "_woundDamage"];

scopeName "main";

if (EGVAR(medical,fatalDamageSource) in [1, 2]) then {
    // Sum of trauma to critical areas can be fatal (e.g. many small hits)    
    private _damageThreshold = GET_DAMAGE_THRESHOLD(_unit);
    private _headThreshhold = 1.25 * _damageThreshold;
    private _bodyThreshhold = 1.5 * _damageThreshold;

    private _bodyPartDamage = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
    _bodyPartDamage params ["_headDamage", "_bodyDamage"];

    private _vitalDamage = ((_headDamage - _headThreshhold) max 0) + ((_bodyDamage - _bodyThreshhold) max 0);
    private _chanceFatal = 1 - exp -((_vitalDamage / FATAL_SUM_DAMAGE_WEIBULL_L) ^ FATAL_SUM_DAMAGE_WEIBULL_K);
    TRACE_3("",_headDamage,_bodyDamage,_vitalDamage,_chanceFatal);

    if (_chanceFatal > random 1) exitWith {
        TRACE_2("determineIfFatal: lethal trauma",_headDamage,_bodyDamage);
        true breakOut "main";
    };

    private _structuralDamage = _unit getVariable [QEGVAR(medical,structuralDamage), 0];
    _vitalDamage = (_structuralDamage - _damageThreshold) max 0;
    _chanceFatal = 1 - exp -((_vitalDamage / FATAL_SUM_DAMAGE_WEIBULL_L) ^ FATAL_SUM_DAMAGE_WEIBULL_K);
    TRACE_3("",_structuralDamage,_vitalDamage,_chanceFatal);

    if (_chanceFatal > random 1) exitWith {
        TRACE_1("determineIfFatal: lethal trauma",_structuralDamage);
        true breakOut "main";
    };
};

false

