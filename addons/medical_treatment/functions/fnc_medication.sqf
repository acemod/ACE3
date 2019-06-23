#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Administers medication to the patient on the given body bodypart.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "RightArm", "Morphine", objNull, "ACE_morphine"] call ace_medical_treatment_fnc_medication
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

[_patient, _usedItem] call FUNC(addToTriageCard);
[_patient, "activity", LSTRING(Activity_usedItem), [[_medic, false, true] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName")]] call FUNC(addToLog);

[QGVAR(medicationLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
