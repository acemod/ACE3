/*
 * Author: Glowbal, KoffeinFlummi
 * Check if a unit is any medical class
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Class <NUMBER> (default: 1)
 *
 * Return Value:
 * Is in of medic class <BOOL>
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_isMedic
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", ["_medicN", 1]];

private _class = _unit getVariable [QEGVAR(medical,medicClass), [0, 1] select (_unit getUnitTrait "medic")];

if (_class >= _medicN min EGVAR(medical,medicSetting)) exitWith {true};
if (!EGVAR(medical,increaseTrainingInLocations)) exitWith {false};

if (([_unit] call FUNC(isInMedicalVehicle)) || {[_unit] call FUNC(isInMedicalFacility)}) then {
    _class = _class + 1; //boost by one: untrained becomes medic, medic becomes doctor
};

_class >= _medicN min EGVAR(medical,medicSetting)
