// by commy2

private ["_unit", "_nearObjects"];

_unit = _this select 0;

_nearObjects = nearestObjects [_unit, ["house", "AllVehicles"], 10];
{
	if (_x getVariable ["AGM_amountFuelCargo", getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "AGM_fuelCapacityCargo")] <= 0) then {
		_nearObjects set [_forEachIndex, objNull];
	};
} forEach _nearObjects;
_nearObjects = _nearObjects - [objNull];

if (count _nearObjects == 0) exitWith {objNull};
_nearObjects select 0
