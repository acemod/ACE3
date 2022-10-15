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
private _time = 0;

if (GVAR(advancedBandages) == 2) then {
    _time = count (_patient call FUNC(getStitchableWounds)) * GVAR(woundStitchTime)
} else {
    // Allow stitching if "Clear Trauma" is set to "After Stitch",
    // but wound reopening is disabled
    if (GVAR(clearTrauma) == 1) then {
        private _bodyPartDamage = _patient getVariable [
            QEGVAR(medical,bodyPartDamage),
            [0,0,0,0,0,0]
        ];

        {
            ADD(_time, _x * GVAR(woundStitchTime));
        } forEach _bodyPartDamage;

        _time = _time max GVAR(woundStitchTime);
    };
};

_time

