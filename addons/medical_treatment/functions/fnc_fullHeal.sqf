#include "script_component.hpp"
/*
 * Author: Glowbal
 * Fully heals the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_fullHeal
 *
 * Public: No
 */

params ["_medic", "_patient"];

[_patient, "activity", LSTRING(Activity_fullHeal), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[QGVAR(fullHealLocal), _patient, _patient] call CBA_fnc_targetEvent;
