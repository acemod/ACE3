#include "..\script_component.hpp"
/*
 * Author: Glowbal, Cplhardcore
 * Handles the medication given to a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Medication Treatment classname <STRING>
 * 2: Incompatible medication <ARRAY><STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "morphine", [["x", 1]]] call ace_medical_treatment_fnc_onMedicationUsage
 *
 * Public: No
 */

params ["_target", "_className", "_incompatibleMedication"];
TRACE_3("onMedicationUsage",_target,_className,_incompatibleMedication);

// Check for overdose from current medication
private _defaultConfig    = configFile >> QUOTE(ADDON) >> "Medication";
private _medicationConfig = _defaultConfig >> _classname;
private _maxDose          = GET_NUMBER(_medicationConfig >> "maxDose",getNumber (_defaultConfig >> "maxDose"));
private _maxDoseDeviation = GET_NUMBER(_medicationConfig >> "maxDoseDeviation",getNumber (_defaultConfig >> "maxDoseDeviation"));
if (_maxDose > 0) then {
    private _currentDose = [_target, _className] call EFUNC(medical_status,getMedicationCount) select 1;
    // Because both {floor random 0} and {floor random 1} return 0
    if (_maxDoseDeviation > 0) then {
        _maxDoseDeviation = _maxDoseDeviation + 1;
    };

    if (_currentDose > _maxDose + (floor random _maxDoseDeviation)) then {
        TRACE_1("exceeded max dose",_currentDose);
        [_target, _classname] call FUNC(overDose);
    };
};

// Check incompatible medication (format [med,limit])
{
    _x params ["_xMed", "_xLimit"];
    private _inSystem = [_target, _xMed] call EFUNC(medical_status,getMedicationCount);
    if (_inSystem> _xLimit) then {
        [_target, _classname] call FUNC(overDose);
    };
} forEach _incompatibleMedication;
