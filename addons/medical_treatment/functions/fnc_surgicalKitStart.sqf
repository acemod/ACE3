#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Handles the surgical kit treatment start by consuming a suture when applicable
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_surgicalKitStart
 *
 * Public: No
 */

if (GVAR(consumeSurgicalKit) == 2) then {
    ([_medic, _patient, ["ACE_suture"]] call FUNC(useItem));
};
