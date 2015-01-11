/*
 * Author: KoffeinFlummi
 *
 * Checks if a unit is in a medical vehicle.
 *
 * Arguments:
 * 0: unit to be checked (object)
 *
 * Return Value:
 * Bool: is unit in medical vehicle?
 */

private ["_unit", "_vehicle"];

_unit = _this select 0;
_vehicle = vehicle _unit;

if (_unit == _vehicle) exitWith {false};
if (_unit in [driver _vehicle, gunner _vehicle, commander _vehicle]) exitWith {false};

_vehicle getVariable ["AGM_isMedic", getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "attendant") == 1]
