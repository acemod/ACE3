#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Fully heals the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part (unused) <STRING>
 * 3: Treatment (unused) <STRING>
 * 4: Item User (unused) <OBJECT>
 * 5: Used Item (unused) <STRING>
 * 6: Create litter (unused) <BOOLEAN>
 * 7: Write message to patient log <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_fullHeal
 *
 * Public: No
 */

params ["_medic", "_patient", "", "", "", "", "", ["_logMessage", true]];
TRACE_3("fullHeal",_medic,_patient,_logMessage);

if (_logMessage) then {
    [_patient, "activity", LSTRING(Activity_fullHeal), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
};

[QGVAR(fullHealLocal), _patient, _patient] call CBA_fnc_targetEvent;
