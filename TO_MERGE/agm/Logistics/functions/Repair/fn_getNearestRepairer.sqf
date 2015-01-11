// by commy2

private ["_unit", "_nearObjects"];

_unit = _this select 0;

_nearObjects = nearestObjects [_unit, ["Car", "Tank", "ReammoBox_F"], 10];
{
	if !(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "AGM_canRepair") > 0) then {
		_nearObjects set [_forEachIndex, objNull];
	};
} forEach _nearObjects;
_nearObjects = _nearObjects - [objNull];

if (count _nearObjects == 0) exitWith {objNull};
_nearObjects select 0
