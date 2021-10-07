#include "script_component.hpp"
/*
 * Author: mharis001
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

private _stitchableWounds = _patient call FUNC(getStitchableWounds);

private _woundCount = 0;
{
    _x params ["_woundID", "_bodyPartN", "_amountOf"];
    _woundCount = _woundCount + (ceil _amountOf);
} forEach _stitchableWounds;

_woundCount * GVAR(woundStitchTime)
