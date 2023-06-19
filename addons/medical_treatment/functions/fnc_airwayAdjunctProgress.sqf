#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles the status of the airway recovery.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic <OBJECT>
 *   1: Patient <OBJECT>
 *
 * Return Value:
 * Continue BVM <BOOL>
 *
 * Example:
 * [[player, cursorObject]] call ace_medical_treatment_fnc_aiwayAdjunctProgress
 *
 * Public: No
 */

params ["_args"];
_args params ["_medic", "_patient"];

// Remove if patient wakes up

!(_patient call EFUNC(common,isAwake))