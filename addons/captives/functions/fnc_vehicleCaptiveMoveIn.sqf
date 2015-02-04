/*
 * Author: PabstMirror
 * Loads a captive into a vehicle
 *
 * Arguments:
 * 0: The Captive <OBJECT>
 * 1: The Vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_target,_vehicle);

private ["_cargoIndex"];

_target moveInCargo _vehicle; 
_target assignAsCargo _vehicle; 
_cargoIndex = _vehicle getCargoIndex _target;
_target setVariable ["ACE_Captives_CargoIndex", _cargoIndex, true];

TRACE_3("moveinEH",_target,_vehicle,_cargoIndex);
