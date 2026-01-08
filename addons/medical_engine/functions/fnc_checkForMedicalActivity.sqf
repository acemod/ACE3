#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Checks for scripted medical activity on a unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_engine_fnc_checkForMedicalActivity
 *
 * Public: No
 */
params ["_unit"];
TRACE_1("checkForMedicalActivity",_unit);

if (!alive _unit || {!local _unit}) exitWith {};
if (IS_MEDICAL_ACTIVITY(_unit)) exitWith {};

{
    _x params ["_var", "_default"];
    if (_unit isNil _var) then { continue };
    private _current = _unit getVariable [_var, _default];
    if (_current isNotEqualTo _default) exitWith {
        TRACE_2("unit has non-defaults",_unit,_var);
        [QEGVAR(medical,activateMedical), _unit] call CBA_fnc_localEvent;
    };
} forEach [
    [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME],
    [VAR_HEART_RATE, DEFAULT_HEART_RATE],
    [VAR_BLOOD_PRESS, [80, 120]],
    [VAR_HEMORRHAGE, 0],
    [VAR_PAIN, 0],
    [VAR_PAIN_SUPP, 0],
    [VAR_OPEN_WOUNDS, createHashMap],
    [VAR_BANDAGED_WOUNDS, createHashMap],
    [VAR_STITCHED_WOUNDS, createHashMap],
    [VAR_FRACTURES, DEFAULT_FRACTURE_VALUES],
    [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES],
    [VAR_MEDICATIONS, []],
    [QEGVAR(medical,occludedMedications), []],
    [QEGVAR(medical,ivBags), []],
    [VAR_BODYPART_DAMAGE, DEFAULT_BODYPART_DAMAGE_VALUES]
];

