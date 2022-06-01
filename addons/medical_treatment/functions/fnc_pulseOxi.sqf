#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Applies a pulseOxi to the patient on the given body part.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment (not used) <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "LeftLeg", "", objNull, "ACE_pulseOxi"] call ace_medical_treatment_fnc_pulseOxi
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "", "", "_usedItem"];

// Exit if there is a pulseOxi already applied to body part
if ([_patient, _bodyPart] call FUNC(hasPulseOxiAppliedTo)) exitWith {
    ["There is already a pulseOxi on this body part!", 1.5] call EFUNC(common,displayTextStructured); // todo: localize
};

[_patient, _usedItem] call FUNC(addToTriageCard);
[_patient, "activity", "Pulse Oximeter applied", [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[QGVAR(pulseOxiLocal), [_patient, _bodyPart], _patient] call CBA_fnc_targetEvent;
