#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Fully heals the patient.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Medic <OBJECT> (default: objNull)
 * 2: Write message to patient log <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_medical_fnc_fullHeal
 *
 * Public: Yes
 */

params [["_patient", objNull, [objNull]], ["_medic", objNull, [objNull]], ["_logMessage", false, [false]]];

if (isNull _medic) then {
    _medic = _patient;
};

if (!alive _patient) exitWith {
    ERROR_2("fullHeal [medic %1][patient %2] Patient is dead or null",_medic,_patient);
};

if (!IS_MEDICAL_ACTIVITY(_patient)) then { [QGVAR(activateMedical), _patient, _patient] call CBA_fnc_targetEvent; };

[_medic, _patient, "", "", objNull, "", false, _logMessage] call EFUNC(medical_treatment,fullHeal);
