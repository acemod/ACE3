#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Decreases burning intensity on successful medical action.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_fire_fnc_medical_success
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname"];

private _intensity = _patient getVariable [QGVAR(intensity), 0];
_intensity = _intensity * INTENSITY_DECREASE_MULT_PAT_DOWN;

_patient setVariable [QGVAR(intensity), _intensity, true];

if (_intensity > BURN_MIN_INTENSITY) then {
    TRACE_1("patient still burning, looping",_this);

    if (EGVAR(medical_gui,pendingReopen)) then {
        TRACE_1("temporarily blocking medical menu reopen",_this);

        EGVAR(medical_gui,pendingReopen) = false;
        [{EGVAR(medical_gui,pendingReopen) = true}] call CBA_fnc_execNextFrame;
    };

    [_medic, _patient, _bodyPart, _classname] call EFUNC(medical_treatment,treatment);
};
