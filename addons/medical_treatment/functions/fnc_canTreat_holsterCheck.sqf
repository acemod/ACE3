#include "script_component.hpp"
/*
 * Author: ddm999
 * Handle holster settings [disabled, lowered, loweredExam, holster, holsterExam]
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Treatment Config <CONFIG>
 *
 * Return Value:
 * Can Treat <BOOL>
 *
 * Example:
 * [player, cursorObject, cfg] call ace_medical_treatment_fnc_canTreat_holsterCheck
 *
 * Public: No
 */

params ["_medic", "_patient", "_config"];

GVAR(holsterRequired) == 0
|| {vehicle _medic != _medic} // medic is in a vehicle, so weapon is considered holstered
|| {vehicle _patient != _patient} // patient is in a vehicle, ^
|| {(GVAR(holsterRequired) in [2,4]) && {getText (_config >> "category") == "examine"}} // if examine bypass is on
|| {currentWeapon _medic isEqualTo ""} // weapon is holstered
|| {(GVAR(holsterRequired) <= 2) && {weaponLowered _medic}} // if just lowered is allowed
