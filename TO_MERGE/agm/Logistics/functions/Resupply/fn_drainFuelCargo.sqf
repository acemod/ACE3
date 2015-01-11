// by commy2

#define TIME_PER_LITER 2

private ["_unit", "_vehicle", "_item", "_fuel", "_fuelCargo", "_time"];

_unit = _this select 0;
_vehicle = _this select 1;

_item = _unit getVariable "AGM_carriedItem";
if (isNil "_item") exitWith {};

_fuel = _item getVariable ["AGM_amountFuel", 20];
_fuelCargo = _vehicle getVariable ["AGM_amountFuelCargo", getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_fuelCapacityCargo")];

_time = TIME_PER_LITER * (_fuelCargo min 20) max 2;

[_time, [_unit, _vehicle], "AGM_Resupply_fnc_drainFuelCargoCallback", localize "STR_AGM_Resupply_DrainingFuelCargo"] call AGM_Core_fnc_progressBar;
[_vehicle] call AGM_Core_fnc_closeDialogIfTargetMoves;
