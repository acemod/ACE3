#include "script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for finishing performing CPR on the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_cprLocal
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("cprLocal",_medic,_patient);

[_patient, "activity", LSTRING(Activity_CPR), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

private _bloodVolume = GET_BLOOD_VOLUME(_patient);
private _successChance = linearConversion [BLOOD_VOLUME_CLASS_4_HEMORRHAGE, BLOOD_VOLUME_CLASS_2_HEMORRHAGE, _bloodVolume, GVAR(cprSuccessChanceMin), GVAR(cprSuccessChanceMax), true];
if ((random 1) < _successChance) then {
    TRACE_2("CPR random success",_bloodVolume,_successChance);
    [QEGVAR(medical,CPRSucceeded), _patient] call CBA_fnc_localEvent;
} else {
    TRACE_2("CPR random fail",_bloodVolume,_successChance);
};

