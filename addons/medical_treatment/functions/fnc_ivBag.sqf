#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Administers an IV bag treatment to the patient.
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
 * [player, cursorObject, "RightArm", "BloodIV", objNull, "ACE_bloodIV"] call ace_medical_treatment_fnc_ivBag
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

[_patient, _usedItem] call FUNC(addToTriageCard);
[_patient, "activity", LSTRING(Activity_gaveIV), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

[QGVAR(ivBagLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
