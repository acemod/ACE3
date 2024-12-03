#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Checks the response status of the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_checkResponse
 *
 * Public: No
 */

params ["_medic", "_patient"];


private _output = if (_patient call EFUNC(common,isAwake)) then {
     LSTRING(Check_Response_Responsive)
} else {
    if (GVAR(advancedDiagnose) == 3) exitWith {
        if (IN_CRDC_ARRST(_patient)) exitWith { LSTRING(Check_Response_CardiacArrestDirect) };
        if (!alive _patient) exitWith { LSTRING(Check_Response_DeadDirect) };
        LSTRING(Check_Response_UnresponsiveDirect)
    };
    if ((GVAR(advancedDiagnose) == 2) && {IN_CRDC_ARRST(_patient)}) exitWith { LSTRING(Check_Response_CardiacArrest) };
    if ((GVAR(advancedDiagnose) == 2) && {!alive _patient}) exitWith { LSTRING(Check_Response_Dead) };
    LSTRING(Check_Response_Unresponsive)
};

[[_output, _patient call EFUNC(common,getName)], 2] call EFUNC(common,displayTextStructured);

[_patient, "quick_view", _output, [[_patient, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
