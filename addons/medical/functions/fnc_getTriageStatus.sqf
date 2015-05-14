/*
 * Author: Glowbal
 * Get the triage status and information from a unit
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * Return Value:
 * Triage status from the unit. Name, statusID, color <ARRAY <STRING><NUMBER><ARRAY>>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit","_return","_status"];
_unit = _this select 0;
_status = _unit getvariable [QGVAR(triageLevel), -1];
_return = switch (_status) do {
    case 1: {[localize "STR_ACE_Medical_Triage_Status_Minor", 1, [0, 0.5, 0, 0.9]]};
    case 2: {[localize "STR_ACE_Medical_Triage_Status_Delayed", 2, [0.7, 0.5, 0, 0.9]]};
    case 3: {[localize "STR_ACE_Medical_Triage_Status_Immediate", 3, [0.4, 0.07, 0.07, 0.9]]};
    case 4: {[localize "STR_ACE_Medical_Triage_Status_Deceased", 4, [0, 0, 0, 0.9]]};
    default {[localize "STR_ACE_Medical_Triage_Status_None", 0, [0, 0, 0, 0.9]]};
};
_return;
