#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Loads a captive into a vehicle
 *
 * Arguments:
 * 0: The Captive <OBJECT>
 * 1: The Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, car1] call ACE_captives_fnc_vehicleCaptiveMoveIn;
 *
 * Public: No
 */

params ["_target","_vehicle"];
TRACE_2("params",_target,_vehicle);

private _getSeat = [_vehicle] call FUNC(findEmptyNonFFVCargoSeat);
TRACE_1("free cargo seat",_getSeat);
_getSeat params ["_cargoIndex"];
if (_cargoIndex == -1) exitWith {WARNING("cargo index -1");};

_target moveInCargo [_vehicle, _cargoIndex];
_target assignAsCargoIndex [_vehicle, _cargoIndex];

_target setVariable [QGVAR(CargoIndex), _cargoIndex, true];
