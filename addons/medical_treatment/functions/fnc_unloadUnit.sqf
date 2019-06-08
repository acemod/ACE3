#include "script_component.hpp"
/*
 * Author: Glowbal
 * Unloads an unconscious or dead patient from their vehicle.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, bob] call ace_medical_treatment_fnc_unloadUnit
 *
 * Public: No
 */

params ["_medic", "_patient"];

if (vehicle _patient == _patient) exitWith {
    TRACE_1("Unit is not in a vehicle",_patient);
};

if (_patient call EFUNC(common,isAwake)) exitWith {
    TRACE_1("Unit is awake",_patient);
};

["ace_unloadPersonEvent", [_patient, vehicle _patient, _medic], _patient] call CBA_fnc_targetEvent;
