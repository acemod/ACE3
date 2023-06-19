#include "script_component.hpp"
/*
 * Author: Slatery
 * Inserts an airway adjunct to the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part (not used) <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorObject, "", "ACE_advancedAirway"] call ace_medical_treatment_fnc_aiwayAdjunct;
 *
 * Public: No
 */

params ["_medic", "_patient", "", "_classname"];
TRACE_4("Airway Adjunct",_medic,_patient, _classname);

[QGVAR(airwayAdjunctLocal), [_medic, _patient, _classname], _patient] call CBA_fnc_targetEvent;
