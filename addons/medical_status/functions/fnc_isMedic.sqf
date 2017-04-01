/*
 * Author: Glowbal, KoffeinFlummi
 * Check if a unit is any medical class
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Class <NUMBER> (default: 1)
 *
 * ReturnValue:
 * Is in of medic class <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_isMedic
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", ["_medicN", 1]];

private _class = _unit getVariable [QGVAR(medicClass), getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "attendant")];

if (_class >= _medicN min GVAR(medicSetting)) exitWith {true};
if (!GVAR(increaseTrainingInLocations)) exitWith {false};

if (([_unit] call FUNC(isInMedicalVehicle)) || {[_unit] call FUNC(isInMedicalFacility)}) then {
    _class = _class + 1; //boost by one: untrained becomes medic, medic becomes doctor
};

_class >= _medicN min GVAR(medicSetting)
