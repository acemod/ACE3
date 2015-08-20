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

private ["_cargoIndex"];

params ["_target","_vehicle"];

// _cargoIndex = [_vehicle] call FUNC(findEmptyNonFFVCargoSeat);
// if (_cargoIndex < 0) exitWith {ERROR("No Seat Avail");};
// _target moveInCargo [_vehicle, _cargoIndex];

_target moveInCargo _vehicle;

_target assignAsCargo _vehicle;

_cargoIndex = _vehicle getCargoIndex _target;
_target setVariable [QGVAR(CargoIndex), _cargoIndex, true];

[_target, "ACE_HandcuffedFFV", 2] call EFUNC(common,doAnimation);
[_target, "ACE_HandcuffedFFV", 1] call EFUNC(common,doAnimation);
