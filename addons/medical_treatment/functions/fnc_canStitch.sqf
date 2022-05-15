#include "script_component.hpp"
/*
 * Author: Katalam, mharis001
 * Checks if the patient can be stitched.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * ReturnValue:
 * Can Stitch <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_medical_treatment_fnc_canStitch
 *
 * Public: No
 */

params ["", "_patient"];

(_patient call FUNC(getStitchableWounds) isNotEqualTo []) ||
{   // Allow stitching if "Clear Trauma" is set to "After Stitch",
    // but wound reopening is disabled
    GVAR(clearTrauma) isEqualTo 1 &&
    {!IS_BLEEDING(_patient)} &&
    {(_patient getVariable [
        QEGVAR(medical,bodyPartDamage),
        [0,0,0,0,0,0]
    ]) isNotEqualTo [0,0,0,0,0,0]}
}
