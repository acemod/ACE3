// by commy2

private ["_unit", "_vehicle", "_item", "_fuel", "_fuelCargo", "_displayName", "_text"];

_unit = _this select 0;
_vehicle = _this select 1;

_item = _unit getVariable "AGM_carriedItem";
if (isNil "_item") exitWith {};

_fuel = _item getVariable ["AGM_amountFuel", 20];
_fuelCargo = _vehicle getVariable ["AGM_amountFuelCargo", getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_fuelCapacityCargo")];

if (_fuel + _fuelCargo < 20) then {
	_fuel = _fuel + _fuelCargo;
	_fuelCargo = 0;
} else {
	_fuelCargo = _fuelCargo + _fuel - 20;
	_fuel = 20;
};

_item setVariable ["AGM_amountFuel", _fuel, true];
_vehicle setVariable ["AGM_amountFuelCargo", _fuelCargo, true];

_displayName = getText (configfile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

_text = format [localize "STR_AGM_Resupply_DrainedFuelCargo", _displayName];
[_text] call AGM_Core_fnc_displayTextStructured;
