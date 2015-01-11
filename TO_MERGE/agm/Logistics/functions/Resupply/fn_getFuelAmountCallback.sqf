// by commy2

private ["_vehicle", "_capacity", "_fuel", "_text"];

_vehicle = _this select 0;

_capacity = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_fuelCapacity");

_fuel = fuel _vehicle * _capacity;
_fuel = (round (10 * _fuel)) / 10;

_text = format [localize "STR_AGM_Resupply_CheckedFuelVehicle", _fuel];
[_text] call AGM_Core_fnc_displayTextStructured;
