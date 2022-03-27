#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Checks if the patient can be placed in a bodybag.
 *
 * 'vehicle _patient' always returns the body
 * '_patient in _patient' always false for body
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Can Place in Bodybag <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_canPlaceInBodybag
 *
 * Public: No
 */

params ["", "_patient"];

(isNull objectParent _patient) && {!(_patient call EFUNC(common,isAwake))}
