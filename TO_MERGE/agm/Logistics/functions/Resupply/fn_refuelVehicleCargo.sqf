// by commy2

#define TIME_PER_LITER 0.1

private ["_vehicle", "_source", "_fuelCargo", "_fuel", "_capacity", "_time"];

_vehicle = _this select 0;

_source = [player] call AGM_Resupply_fnc_getNearestRefueler;
if (isNull _source) exitWith {};

_fuelCargo = _source getVariable ["AGM_amountFuelCargo", getNumber (configFile >> "CfgVehicles" >> typeOf _source >> "AGM_fuelCapacityCargo")];

_capacity = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_fuelCapacity");

_fuel = fuel _vehicle * _capacity;

_time = TIME_PER_LITER * (_capacity - _fuel min _fuelCargo) max 2;

[_time, [_vehicle, _source], "AGM_Resupply_fnc_refuelVehicleCargoCallback", localize "STR_AGM_Resupply_RefuelingVehicle"] call AGM_Core_fnc_progressBar;
[_vehicle] call AGM_Core_fnc_closeDialogIfTargetMoves;
[_source] call AGM_Core_fnc_closeDialogIfTargetMoves;
