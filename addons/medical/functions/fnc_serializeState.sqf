#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Serializes the medical state of a unit into a string.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Serialized state as JSON string
 *
 * Example:
 * [player] call ace_medical_fnc_serializeState
 *
 * Public: Yes
 */
params [["_unit", objNull, [objNull]]];

private _state = [] call CBA_fnc_createNamespace;

// For variables, see: EFUNC(medical_status,initUnit)
{
    _x params ["_var"];
    _state setVariable [_var, _unit getVariable _x];
} forEach [
    [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME],
    [VAR_HEART_RATE, DEFAULT_HEART_RATE],
    [VAR_BLOOD_PRESS, [80, 120]],
    [VAR_PERIPH_RES, DEFAULT_PERIPH_RES],
    // State transition should handle this
    // [VAR_CRDC_ARRST, false],
    [VAR_HEMORRHAGE, 0],
    [VAR_PAIN, 0],
    [VAR_IN_PAIN, false],
    [VAR_PAIN_SUPP, 0],
    [VAR_OPEN_WOUNDS, []],
    [VAR_BANDAGED_WOUNDS, []],
    [VAR_STITCHED_WOUNDS, []],
    [VAR_FRACTURES, DEFAULT_FRACTURE_VALUES],
    // State transition should handle this
    // [VAR_UNCON, false],
    [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES],
    [QEGVAR(medical,occludedMedications), nil],
    [QEGVAR(medical,ivBags), nil],
    [QEGVAR(medical,triageLevel), 0],
    [QEGVAR(medical,triageCard), []],
    [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]]
    // Time needs to be converted
    // [VAR_MEDICATIONS, []]
];

// Convert medications time to offset
private _medications = _unit getVariable [VAR_MEDICATIONS, []];
{
    _x set [1, _x#1 - CBA_missionTime];
} forEach _medications;
_state setVariable [VAR_MEDICATIONS, _medications];

// Medical statemachine state
private _currentState = [_unit, GVAR(STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
_state setVariable [QGVAR(statemachineState), _currentState];

// Serialize & return
[_state] call CBA_fnc_encodeJSON
