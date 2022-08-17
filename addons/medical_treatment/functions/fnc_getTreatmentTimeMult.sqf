#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Gets multiplier for time taken to apply a particular treatment based on user's medic level
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Treatment <String>
 *
 * Return Value:
 * Multiplier <NUMBER>
 *
 * Example:
 * [player, "PAK"] call ace_medical_treatment_fnc_getTreatmentTimeMult
 *
 * Public: No
 */

params ["_medic", "_treatment"];

//doctor
if ([_medic, 2] call FUNC(isMedic)) exitwith {
    missionNamespace getVariable [format [QGVAR(treatmentTime%1MultDoctor), _treatment], 1] //return
};

//medic
if ([_medic, 1] call FUNC(isMedic)) exitwith {
    missionNamespace getVariable [format [QGVAR(treatmentTime%1MultMedic), _treatment], 1] //return
};

1 //return default
