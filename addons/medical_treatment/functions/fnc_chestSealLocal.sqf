#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Local callback for applying a splint to a patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorObject, "LeftLeg"] call ace_medical_treatment_fnc_splintLocal
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("chestSealLocal",_medic,_patient);

_patient setVariable [VAR_PNEUMO, false, true];

[_patient, "ACE_chestSeal"] call FUNC(addToTriageCard);
[_patient, "activity", "Applied chest seal", [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
