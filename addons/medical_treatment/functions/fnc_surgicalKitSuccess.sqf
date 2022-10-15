#include "script_component.hpp"
/*
 * Author: Freddo
 * Handles the surgical kit treatment by resetting bodypart damage.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player] call ace_medical_treatment_fnc_surgicalKitSuccess
 *
 * Public: No
 */

params ["_medic", "_patient"];

if (GVAR(clearTrauma) == 1 && {GVAR(advancedBandages) != 2}) then {
    TRACE_2("clearTrauma - clearing trauma after stitching (no reopening)",_medic,_patient);
    _patient setVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0], true];

    [_patient, true, true, true, true] call EFUNC(medical_engine,updateBodyPartVisuals);
};


nil
