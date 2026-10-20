#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Removes a SpO2 duty factor.
 *
 * Arguments:
 * 0: Factor ID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ID"] call ace_medical_vitals_fnc_removeSpO2DutyFactor
 *
 * Public: No
 */
params [["_id", "", [""]]];

GVAR(spo2DutyList) deleteAt _id;
