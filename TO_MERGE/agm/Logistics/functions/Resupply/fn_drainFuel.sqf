// by commy2

#define TIME_PER_LITER 2

private ["_unit", "_vehicle", "_item", "_fuel", "_capacity", "_fuelVehicle", "_time"];

_unit = _this select 0;
_vehicle = _this select 1;

_item = _unit getVariable "AGM_carriedItem";
if (isNil "_item") exitWith {};

_fuel = _item getVariable ["AGM_amountFuel", 20];

_capacity = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_fuelCapacity");

_fuelVehicle = fuel _vehicle * _capacity;

_time = TIME_PER_LITER * (_fuelVehicle min 20) max 2;

[_time, [_unit, _vehicle], "AGM_Resupply_fnc_drainFuelCallback", localize "STR_AGM_Resupply_DrainingFuel"] call AGM_Core_fnc_progressBar;
[_vehicle] call AGM_Core_fnc_closeDialogIfTargetMoves;
