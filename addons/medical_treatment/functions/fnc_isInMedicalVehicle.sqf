#include "script_component.hpp"
/*
 * Author: KoffeinFlummi
 * Checks if the unit is in a medical vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * In Medical Vehicle <BOOL>
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_isInMedicalVehicle
 *
 * Public: No
 */

params ["_unit"];

private _vehicle = vehicle _unit;

_unit != _vehicle && {!(_unit in [driver _vehicle, gunner _vehicle, commander _vehicle])} && {[_vehicle] call FUNC(isMedicalVehicle)}
