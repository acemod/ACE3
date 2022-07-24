#include "script_component.hpp"
/*
 * Author: Glowbal, KoffeinFlummi
 * Checks if the unit is a medic of the given level.
 * Medic Levels: 0 - None, 1 - Medic, 2 - Doctor
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Medic Level <NUMBER> (default: 1)
 *
 * Return Value:
 * Is Medic <BOOL>
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_isMedic
 *
 * Public: No
 */

params ["_unit", ["_medicN", 1]];

private _class = _unit getVariable [QEGVAR(medical,medicClass), parseNumber (_unit getUnitTrait "medic")];

if (_class >= _medicN) exitWith {true};
if (!GVAR(locationsBoostTraining)) exitWith {false};

if (IN_MED_VEHICLE(_unit) || {IN_MED_FACILITY(_unit)}) then {
    _class = _class + 1; // Boost medical training by one: untrained becomes medic, medic becomes doctor
};

_class >= _medicN
