// by commy2

private ["_unit", "_vehicle", "_item", "_fuel", "_capacity", "_fuelVehicle", "_displayName", "_text"];

_unit = _this select 0;
_vehicle = _this select 1;

_item = _unit getVariable "AGM_carriedItem";
if (isNil "_item") exitWith {};

_fuel = _item getVariable ["AGM_amountFuel", 20];

_capacity = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_fuelCapacity");

_fuelVehicle = fuel _vehicle * _capacity;

if (_fuel + _fuelVehicle < _capacity) then {
	_fuelVehicle = _fuelVehicle + _fuel;
	_fuel = 0;
} else {
	_fuel = _fuel + _fuelVehicle - _capacity;
	_fuelVehicle = _capacity;
};

[[_vehicle, _fuelVehicle / _capacity], "{(_this select 0) setFuel (_this select 1)}", _vehicle] call AGM_Core_fnc_execRemoteFnc;
_item setVariable ["AGM_amountFuel", _fuel, true];

_displayName = getText (configfile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

_text = format [localize "STR_AGM_Resupply_RefueledVehicle", _displayName];
[_text] call AGM_Core_fnc_displayTextStructured;
