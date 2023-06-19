#include "script_component.hpp"
/*
 * Author: Slatery
 * Checks if the patient can have their head tilted.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Can tilt head <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_canHeadTilt
 *
 * Public: No
 */

params ["", "_patient"];

IS_UNCONSCIOUS(_patient) && {
	GET_AIRWAY_BLOCKED(_patient) == false
}&&{
	GET_AIRWAY_TREATMENT_LVL(_patient) < 1
}
