#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Fully heals the patient.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Medic <OBJECT><OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_medical_fnc_fullHeal
 *
 * Public: Yes
 */

params [["_patient", objNull, [objNull]], ["_medic", objNull, [objNull]]];

if (isNull _medic) then {
    _medic = _patient;
};

if (!alive _patient) exitWith {
    ERROR_2("fullHeal [medic %1][patient %2] Bad parameters",_medic,_patient);
};

[_medic, _patient] call EFUNC(medical_treatment,fullHeal);
nil
