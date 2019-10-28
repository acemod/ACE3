#include "script_component.hpp"
/*
 * Author: Glowbal
 * Bandages open wounds on the given body part of the patient.
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
 * [player, cursorObject, "Head", "FieldDressing"] call ace_medical_treatment_fnc_bandage
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname"];

[_patient, "activity", LSTRING(Activity_bandagedPatient), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[{ // Reset canTreatCached after treatment happens
    params ["_patient", "_oldOpenWounds"];
    !(_oldOpenWounds isEqualTo GET_OPEN_WOUNDS(_patient))
}, {
    [QEGVAR(interact_menu,clearConditionCaches), []] call CBA_fnc_localEvent;
}, [_patient, +GET_OPEN_WOUNDS(_patient)], 3] call CBA_fnc_waitUntilAndExecute; // make copy of array

[QGVAR(bandageLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
