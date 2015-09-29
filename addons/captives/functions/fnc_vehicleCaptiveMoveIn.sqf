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
 * [bob, car1] call ACE_captives_fnc_vehicleCaptiveMoveIn;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target","_vehicle"];
TRACE_2("params",_target,_vehicle);

private ["_cargoIndex"];

_getSeat = [_vehicle] call FUNC(findEmptyNonFFVCargoSeat);
TRACE_1("free cargo seat",_getSeat);
_cargoIndex = _getSeat select 0;
if (_cargoIndex == -1) exitWith {ERROR("cargo index -1");};

_target moveInCargo [_vehicle, _cargoIndex];
_target assignAsCargoIndex [_vehicle, _cargoIndex];

_target setVariable [QGVAR(CargoIndex), _cargoIndex, true];
