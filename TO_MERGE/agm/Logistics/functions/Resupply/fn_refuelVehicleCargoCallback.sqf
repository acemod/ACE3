// by commy2

private ["_vehicle", "_target", "_fuel", "_capacity", "_fuelVehicle", "_displayName", "_text"];

_vehicle = _this select 0;
_source = _this select 1;

_fuel = _source getVariable ["AGM_amountFuelCargo", getNumber (configFile >> "CfgVehicles" >> typeOf _source >> "AGM_fuelCapacityCargo")];

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
_source setVariable ["AGM_amountFuelCargo", _fuel, true];

_displayName = getText (configfile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

_text = format [localize "STR_AGM_Resupply_RefueledVehicle", _displayName];
[_text] call AGM_Core_fnc_displayTextStructured;
