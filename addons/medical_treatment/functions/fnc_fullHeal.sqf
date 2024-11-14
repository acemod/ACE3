#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Fully heals the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Write message to patient log <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_fullHeal
 *
 * Public: No
 */

params ["_medic", "_patient", ["_logMessage", true]];

if (_logMessage) then {
    [_patient, "activity", LSTRING(Activity_fullHeal), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
};

[QGVAR(fullHealLocal), _patient, _patient] call CBA_fnc_targetEvent;
