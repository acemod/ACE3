#include "..\script_component.hpp"
/*
 * Author: DartRuffian
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
 * [player, cursorObject] call ace_medical_fnc_fullHeal
 *
 * Public: Yes
 */

params [["_medic", objNull, [objNull]], ["_patient", objNull, [objNull]]];

if (isNull _medic or !alive _patient) exitWith {
    ERROR_2("fullHeal [medic %1][patient %2] Bad parameters",_medic,_patient);
};

[_medic, _patient] call EFUNC(medical_treatment,fullHeal);
nil
