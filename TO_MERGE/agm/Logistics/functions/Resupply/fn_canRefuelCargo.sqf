// by commy2

private ["_target", "_vehicle", "_fuel"];

_target = _this select 0;

_vehicle = [player] call AGM_Resupply_fnc_getNearestRefueler;

_fuel = _vehicle getVariable ["AGM_amountFuelCargo", getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_fuelCapacityCargo")];

!isNull _vehicle
&& {alive _target}
&& {alive _vehicle}
&& {speed _target == 0}
&& {speed _vehicle == 0}
&& {fuel _target < 1}
&& {_fuel > 0}
