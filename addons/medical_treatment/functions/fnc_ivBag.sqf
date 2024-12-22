#include "..\script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Administers an IV bag treatment to the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
<<<<<<< HEAD
 * 4: Item User (not used) <OBJECT>
=======
 * 4: Item User <OBJECT>
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
<<<<<<< HEAD
 * [player, cursorObject, "RightArm", "BloodIV", objNull, "ACE_bloodIV"] call ace_medical_treatment_fnc_ivBag
=======
 * [player, cursorObject, "RightArm", "BloodIV", player, "ACE_bloodIV"] call ace_medical_treatment_fnc_ivBag
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
 *
 * Public: No
 */

<<<<<<< HEAD
params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];
=======
params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673

[_patient, _usedItem] call FUNC(addToTriageCard);
[_patient, "activity", LSTRING(Activity_gaveIV), [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

<<<<<<< HEAD
[QGVAR(ivBagLocal), [_patient, _bodyPart, _classname, _medic], _patient] call CBA_fnc_targetEvent;
=======
[QGVAR(ivBagLocal), [_patient, _bodyPart, _classname, _medic, _itemUser, _usedItem], _patient] call CBA_fnc_targetEvent;
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
