#include "script_component.hpp"
/*
 * Author: Glowbal
 * Bandages open wounds on the given body part of the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "Head", "FieldDressing"] call ace_medical_treatment_fnc_bandage
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname"];

[_patient, "activity", LSTRING(Activity_bandagedPatient), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[QGVAR(bandageLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
