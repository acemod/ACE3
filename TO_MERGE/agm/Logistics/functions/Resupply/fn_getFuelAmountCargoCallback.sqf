// by commy2

private ["_vehicle", "_fuel", "_text"];

_vehicle = _this select 0;

_fuel = _vehicle getVariable ["AGM_amountFuelCargo", getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_fuelCapacityCargo")];

_text = format [localize "STR_AGM_Resupply_CheckedFuelVehicleCargo", _fuel];
[_text] call AGM_Core_fnc_displayTextStructured;
