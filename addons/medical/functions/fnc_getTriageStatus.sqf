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
 * Example:
 * [bob] call ace_medical_fnc_getTriageStatus
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];

private _status = _unit getVariable [QGVAR(triageLevel), -1];
private _return = switch (_status) do {
    case 1: {[localize LSTRING(Triage_Status_Minor), 1, [0, 0.5, 0, 0.9]]};
    case 2: {[localize LSTRING(Triage_Status_Delayed), 2, [0.7, 0.5, 0, 0.9]]};
    case 3: {[localize LSTRING(Triage_Status_Immediate), 3, [0.4, 0.07, 0.07, 0.9]]};
    case 4: {[localize LSTRING(Triage_Status_Deceased), 4, [0, 0, 0, 0.9]]};
    default {[localize LSTRING(Triage_Status_None), 0, [0, 0, 0, 0.9]]};
};
_return
