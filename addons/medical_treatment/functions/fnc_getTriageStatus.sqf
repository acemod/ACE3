#include "script_component.hpp"
/*
 * Author: Glowbal
 * Get the triage status and information from a unit
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * Return Value:
 * 0: Name <STRING>
 * 1: Status ID <NUMBER>
 * 2: Color <ARRAY <NUMBER>>
 *
 * Public: Yes
 */

private ["_unit","_return","_status"];
params ["_unit"];
_status = _unit getVariable [QEGVAR(medical,triageLevel), -1];
_return = switch (_status) do {
    case 1: {[localize ELSTRING(medical_treatment,Triage_Status_Minor), 1, [0, 0.5, 0, 0.9]]};
    case 2: {[localize ELSTRING(medical_treatment,Triage_Status_Delayed), 2, [0.7, 0.5, 0, 0.9]]};
    case 3: {[localize ELSTRING(medical_treatment,Triage_Status_Immediate), 3, [0.4, 0.07, 0.07, 0.9]]};
    case 4: {[localize ELSTRING(medical_treatment,Triage_Status_Deceased), 4, [0, 0, 0, 0.9]]};
    default {[localize ELSTRING(medical_treatment,Triage_Status_None), 0, [0, 0, 0, 0.9]]};
};
_return
