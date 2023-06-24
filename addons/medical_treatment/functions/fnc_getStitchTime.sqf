#include "script_component.hpp"
/*
 * Author: kymckay
 * Calculates the Surgical Kit treatment time based on the amount of stitchable wounds.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_getStitchTime
 *
 * Public: No
 */

params ["", "_patient"];


private _stitchableTotal = 0;

{
    _stitchableTotal = _stitchableTotal + count _y;
} forEach (_patient call FUNC(getStitchableWounds));

_stitchableTotal * GVAR(woundStitchTime)
